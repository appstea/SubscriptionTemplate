//
//  Subs~PurchasesManager.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/15/22.
//

import Foundation

import StoreKit
import AppTrackingTransparency
import AdSupport

import RevenueCat

import Stored

extension Subs {

  final class PurchasesManager: NSObject {

    typealias SubsCompletion = () -> Void

    struct RCSetup {
//      let apiKey: String
      let offering: String

//      Внутри него packages:
//      $rc_monthly и
//      $rc_annual
    }

    private enum Const {
      static let requestMaxTryCount = 5
      static let retryDelay = DispatchTimeInterval.seconds(1)
      static let syncDelay = DispatchTimeInterval.seconds(1)
    }

    var debugPremium = false

    var hasProducts: Bool { !products.isEmpty }
    var isPremium: Bool {
      if isDebug {
        return debugPremium || premium
      }
      return premium
    }

    private var isLoadingProducts: Bool = false
    private var isLoadingCustomerInfo: Bool = false
    private var productsRequestTry = 0
    private var customerInfoTry = 0

    private weak var currentSubsScreen: Subs.ViewController?
    private let transactionsObserver = TransactionsObserver()

    private var products: [StoreProduct] = [] {
      didSet { Notification.Subs.Update.post() }
    }

    private var premium: Bool = false {
      didSet {
        if oldValue != premium {
          Notification.Subs.Update.post()

          Stored.isPremium = premium
        }
      }
    }

    private let config: Config
    private let isDebug: Bool
    private let rcSetup: RCSetup

    // MARK: - Init

    init(config: Config) {
      self.config = config
      isDebug = config.subs.isDebug
      rcSetup = .init(offering: config.subs.offering)
      super.init()

      Purchases.logLevel = isDebug ? .debug : .warn
      Purchases.automaticAppleSearchAdsAttributionCollection = true
      Purchases.configure(withAPIKey: config.subs.apiKey)
      Purchases.shared.delegate = self
      SKPaymentQueue.default().add(transactionsObserver)
      syncIfNeeded()
    }

    // MARK: - Public
    // MARK: - UI

    func subsScreen(source: Subs.Source, screen: Subs.Screen, intent: Subs.Intent,
                    completion: (() -> Void)? = nil) -> Subs.ViewController {
      let result = Subs.InitialVC(config: config, source: source, intent: intent, onClose: { vc in
        vc.dismiss(animated: true)
        completion?()
      })
      if let vm = config.ui.subscription {
        result.viewModel = vm
      }
      return result
    }

    func showSubsScreen(source: Subs.Source, screen: Subs.Screen, intent: Subs.Intent,
                        from presenter: UIViewController, completion: (() -> Void)? = nil) {
      if let current = currentSubsScreen {
        if current.source == source,
           current.intent == intent {
          return
        }

        hideCurrentSubsScreen(animated: true) { [weak self] in
          self?.showSubsScreen(source: source, screen: screen, intent: intent,
                               from: presenter, completion: completion)
        }
      }

      let subsVC = subsScreen(source: source, screen: screen, intent: intent) { [weak self] in
        self?.currentSubsScreen = nil
        completion?()
      }

      currentSubsScreen = subsVC
      subsVC.modalPresentationStyle = .overFullScreen
      presenter.present(subsVC, animated: true)
    }

    func hideCurrentSubsScreen(animated: Bool = true, completion: (() -> Void)? = nil) {
      let current = currentSubsScreen
      currentSubsScreen?.dismiss(animated: animated) { [weak self] in
        if current == self?.currentSubsScreen {
          self?.currentSubsScreen = nil
        }
        completion?()
      }
    }

    func performPrepermissionChecks() {
      checkIDFAAccessIfNeeded()
    }

    func checkIDFAAccessIfNeeded() {
      if #available(iOS 14.5, *) {
        requestAppTrackingTransparencyPermission()
      }
      else {
        updateIDFAAttribute()
      }
    }

    func updateIDFAAttribute() {
      let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
      Subs.Service.shared?.updateAttribute(.idfa(idfa))
    }

    @available(iOS 14.5, *)
    func requestAppTrackingTransparencyPermission(completion: (() -> Void)? = nil) {
      ATTrackingManager.requestTrackingAuthorization { [weak self] status in
//        let analytics = Analytics.Service.shared
        switch status {
        case .authorized:
          self?.updateIDFAAttribute()
//          analytics?.sendEvent(.didCompleteATTRequest(status: .authorized))
//          FBAdSettings.setAdvertiserTrackingEnabled(true)
        case .denied:
//          analytics?.sendEvent(.didCompleteATTRequest(status: .denied))
//          FBAdSettings.setAdvertiserTrackingEnabled(false)
          break
        case .notDetermined:
//          analytics?.sendEvent(.didCompleteATTRequest(status: .notDetermined))
//          FBAdSettings.setAdvertiserTrackingEnabled(false)
          break
        case .restricted:
//          analytics?.sendEvent(.didCompleteATTRequest(status: .restricted))
//          FBAdSettings.setAdvertiserTrackingEnabled(false)
          break
        @unknown default: break
        }
      }
    }

    // MARK: - Logic

    func syncIfNeeded() {
      if !isLoadingCustomerInfo {
        customerInfoTry = 0
        getCustomerInfo()
      }

      if !isLoadingProducts {
        productsRequestTry = 0
        getProductsInfo()
      }
    }

    enum PurchaseResult: Equatable {
      case purchasing
      case purchased(isTrial: Bool)
      case restored(isTrial: Bool)
      case failed
      case deferred
      case unknown
    }
    func purchase(product: StoreProduct, source: Subs.Source, completion: ((PurchaseResult) -> Void)?) {
      HUD.show()
      Purchases.shared.purchase(product: product) { [weak self] transaction, customerInfo, error, _ in
        defer {
          HUD.dismiss()
        }
        guard let transaction = transaction, error == nil else {
          completion?(.failed)
          return
        }

        let result: PurchaseResult
        switch transaction.sk1Transaction?.transactionState {
        case .failed: result = .failed
        case .deferred: result = .deferred
        case .purchasing: result = .purchasing
        case .purchased:
          result = .purchased(isTrial: product.introductoryDiscount?.paymentMode == .freeTrial)
        case .restored:
          result = .restored(isTrial: product.introductoryDiscount?.paymentMode == .freeTrial)
        default:
          result = .unknown
        }

        if let self = self {
          let hasActiveEntitlement = customerInfo?.entitlements[product.productIdentifier]?.isActive == true
          let isSuccessful = result.isAny(of: .purchased(isTrial: false), .purchased(isTrial: true),
                                          .restored(isTrial: false), .restored(isTrial: true))
          self.premium = hasActiveEntitlement || isSuccessful
          if !hasActiveEntitlement {
            self.schedulePurchaseSync()
          }
        }
        completion?(result)
      }
    }

    func restore(block: ((RestoreResponseType) -> Void)?) {
      HUD.show()
      Purchases.shared.restorePurchases { [weak self] customInfo, error in
        defer { HUD.dismiss() }

        guard error == nil else {

          block?(.error)
          return
        }

        if Subs.Product.allCases.contains(where: { customInfo?.entitlements[$0.id]?.isActive == true }) {
          self?.premium = true
          block?(.success)
        }
        else {
          block?(.noProducts)
        }
      }
    }

    func productsList(for intent: Subs.Intent?) -> [StoreProduct] {
      switch intent {
      case .normal:
        return products.filter { $0.productIdentifier == Subs.Product.monthly.id }
      case .onStart:
        return products.filter { $0.productIdentifier == Subs.Product.monthly.id }
//      case .additionTrial:
//        return products.filter { $0.productIdentifier == Subs.Product.oneMonth_sevenDaysTrial.id }
//      case .additionInstant:
//        return products.filter { $0.productIdentifier == Subs.Product.threeMonths.id }
//      case .instant:
//        return products.filter { $0.productIdentifier == Subs.Product.quarterly.id }
//      case .trial:
//        return products.filter { $0.productIdentifier == Subs.Product.monthly.id }
#if DEBUG
      case .products(let products):
        return self.products.filter { products.map(\.id).contains($0.productIdentifier) }
#endif
      case .none:
        return products
      }
    }

  }
}

// MARK: - Private

private extension Subs.PurchasesManager {

  func getCustomerInfo() {
    customerInfoTry += 1
    guard customerInfoTry <= Const.requestMaxTryCount else {
      isLoadingCustomerInfo = false
      return
    }

    isLoadingCustomerInfo = true
    Purchases.shared.getCustomerInfo { [weak self] customerInfo, _ in
      self?.handleCustomerInfo(customerInfo)
    }
  }

  func getProductsInfo() {
    productsRequestTry += 1
    guard productsRequestTry <= Const.requestMaxTryCount else {
      isLoadingProducts = false
      return
    }

    isLoadingProducts = true
    Purchases.shared.getOfferings { [weak self] offerings, _ in
      guard let self = self else { return }

      if let packages = offerings?.current?.availablePackages {
        for package in packages {
          self.products.append(package.storeProduct)
        }
      }

      if let packages = offerings?.offering(identifier: self.rcSetup.offering)?.availablePackages {
        for package in packages {
          self.products.append(package.storeProduct)
        }
      }
      debugPrint("[DEBUG] Products: \(self.products)")
      self.isLoadingProducts = false
      Notification.Subs.Update.post()
    }
  }

  func schedulePurchaseSync() {
    DispatchQueue.main.asyncAfter(deadline: .now() + Const.syncDelay) { [weak self] in
      self?.syncIfNeeded()
    }
  }

  func handleCustomerInfo(_ info: CustomerInfo?) {
    guard let info = info else {
      premium = false

      DispatchQueue.main.asyncAfter(deadline: .now() + Const.retryDelay) { [weak self] in
        self?.getCustomerInfo()
      }
      return
    }

    isLoadingCustomerInfo = false
    guard !info.entitlements.all.isEmpty else {
      premium = false
      return
    }

    premium = Subs.Product.allCases.contains { info.entitlements[$0.id]?.isActive == true }
  }

}

// MARK: - PurchasesDelegate

extension Subs.PurchasesManager: PurchasesDelegate {

  func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {
    handleCustomerInfo(customerInfo)
  }

  func purchases(_ purchases: Purchases,
                 readyForPromotedProduct product: StoreProduct,
                 purchase startPurchase: @escaping StartPurchaseBlock) {
    startPurchase { [weak self] _, customInfo, _, _ in
      self?.handleCustomerInfo(customInfo)
    }
  }

}

// MARK: - TransactionsObserver

private class TransactionsObserver: NSObject, SKPaymentTransactionObserver {

  func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) { }

  func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
    true
  }

}
