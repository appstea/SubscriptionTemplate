//
//  Subs~Service.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation

import StoreKit
import AppTrackingTransparency
//import AdSupport
//import iAd

import RevenueCat

//enum Result {
//  case regular
//  case additionalOffer
//}
//
//enum RestoreResponseType {
//  case success
//  case noProducts
//  case error
//}
//
//extension ServiceIds {
//  
//  static let _subs = ServiceIdentifier<Subs.Service> { Subs.Service(component: __root.__subscriptionsComponent) }
//  var subs: ServiceIdentifier<Subs.Service> { Self._subs }
//  
//}
//
//extension DefaultsKeys {
//  
//  var isPremium: DefaultsKey<Bool> { .init("stored.session.isPremium", defaultValue: false) }
//  
//}
//
//extension Subs {
//  
//  final class Service: AppService {
//    
//    enum Attribute {
//      case idfa(String)
//      case idfv(String)
//      case apns(Data)
//      case fcm(String)
//      case fbAnonId(String)
//      
//      // swiftlint:disable:next nesting
//      enum Branch {
//        case mediaSource(String)
//        case campaign(String)
//        case adGroup(String)
//        case ad(String)
//        case keyword(String)
//        case creative(String)
//      }
//      case branch(Branch)
//      
//      case onboarding(Onboarding)
//    }
//    
//    private lazy var manager = SubscriptionManager(component: component)
//    
//    var isPremium: Bool { manager.isPremium }
//    
//#if DEBUG
//    var isDebugPremium: Bool {
//      get { manager.debugPremium }
//      set { manager.debugPremium = newValue }
//    }
//#endif
//    
//    private let component: SubscriptionsComponent
//    
//    // MARK: - Init
//    
//    init() { preconditionFailure() }
//    
//    fileprivate init(component: SubscriptionsComponent) {
//      self.component = component
//    }
//    
//    // MARK: - Lifecycle
//    
//    func setup(with launchOptions: LaunchOptions) {
//      _ = manager
//      observeSessions()
//      if let idfv = UIDevice.current.identifierForVendor {
//        updateAttribute(.idfv(idfv.uuidString))
//      }
//      if let fbAnonymousID = component.services.facebook?.anonymousID {
//        updateAttribute(.fbAnonId(fbAnonymousID))
//      }
//    }
//    
//    func appDidBecomeActive() {
//      sync()
//    }
//    
//    func appDidEnterBackground() {
//      manager.hideCurrentSubsScreen(animated: false)
//    }
//    
//    func appDidRegisterForRemoteNotifications(with deviceToken: Data) {
//      updateAttribute(.apns(deviceToken))
//    }
//    
//    // MARK: - Public
//    
//    // swiftlint:disable:next cyclomatic_complexity
//    func updateAttribute(_ attribute: Attribute) {
//      let purchases = Purchases.shared
//      switch attribute {
//      case .apns(let data): purchases.setPushToken(data)
//      case .fcm(let token): purchases.setAttributes(["$fcmTokens": token])
//      case .idfa(let id): purchases.setAttributes(["$idfa": id])
//      case .idfv(let id): purchases.setAttributes(["$idfv": id])
//      case .fbAnonId(let id): purchases.setFBAnonymousID(id)
//      case .branch(let attribute):
//        switch attribute {
//        case .mediaSource(let source): purchases.setMediaSource(source)
//        case .campaign(let campaign): purchases.setCampaign(campaign)
//        case .adGroup(let group): purchases.setAdGroup(group)
//        case .ad(let id): purchases.setAd(id)
//        case .keyword(let keyword): purchases.setKeyword(keyword)
//        case .creative(let id): purchases.setCreative(id)
//        }
//      case .onboarding(let onboarding):
//        switch onboarding {
//        case .classic: purchases.setAttributes(["onboarding": "classic"])
//        case .houses: purchases.setAttributes(["onboarding": "houses"])
//        }
//      }
//    }
//    
//    typealias SubsCompletion = (Result) -> Void
//    func showSubscription(source: Subs.Source, intent: Subs.Intent, session: Int? = 0,
//                          from presenter: UIViewController? = nil, completion: SubsCompletion? = nil) {
//      component.config.data { config in
//        DispatchQueue.main.async { [weak self] in
//          let context = Context(sessionNumber: session ?? 0, intervalNumber: config.offerShowSessionInterval, repeatNumber: config.offerShowSessionRepeat)
//          self?._showSubsScreen(source: source, screen: config.subsScreen, intent: intent, context: context, completion: {
//            completion?(.regular)
//          })
//        }
//      }
//    }
//    
//    func subsScreen(source: Subs.Source, intent: Subs.Intent, completion: SubsCompletion? = nil,
//                    onReady: @escaping (UIViewController) -> Void) {
//      component.config.data { config in
//        DispatchQueue.main.async { [weak self] in
//          guard let self = self else { return }
//          
//          let result = self._subsScreenViewController(source: source, screen: config.subsScreen,
//                                                      intent: intent, completion: completion)
//          onReady(result)
//        }
//      }
//    }
//    
//#if DEBUG
//    func showSubscription(source: Subs.Source, screen: Subs.Screen, intent: Subs.Intent,
//                          from presenter: UIViewController? = nil, completion: (() -> Void)? = nil) {
//      let context = Context(sessionNumber: 0, intervalNumber: 0, repeatNumber: 0)
//      _showSubsScreen(source: source, screen: screen, intent: intent, context: context, from: presenter, completion: completion)
//    }
//#endif
//    
//    func sync() {
//      manager.syncIfNeeded()
//    }
//    
//    func restore(completion: ((RestoreResponseType) -> Void)? = nil) {
//      manager.restore(block: completion)
//    }
//    
//    func hasProducts() -> Bool {
//      manager.hasProducts
//    }
//    
//    func productsList(for intent: Subs.Intent? = nil) -> [SKProduct] {
//      manager.productsList(for: intent)
//    }
//    
//    func purchase(_ product: SKProduct, intent: Subs.Intent, source: Subs.Source, block: ((Bool) -> Void)? = nil) {
//      manager.purchase(product: product, source: source) { [weak self] result in
//        switch result {
//        case .purchased(let isTrial):
//          self?.component.services.analytics?.sendSubsEvent(
//            .subscribe(intent: intent, source: source,
//                       productId: product.productIdentifier, isTrial: isTrial))
//          if isTrial {
//            self?.component.services.analytics?.sendSubsTrialEvent(.start)
//          }
//          block?(true)
//        default: break
//        }
//      }
//    }
//    
//  }
//}
//
//// MARK: - Private
//
//private extension Subs.Service {
//  
//  func observeSessions() {
//    Notification.Session.Change.observe { [weak self] session in
//      self?.component.config.data { [weak self] in
//        guard let self = self, !self.isPremium,
//              session > 0, $0.subsShowSessionInterval > 0, !Calendar.current.isDateInToday(self.component.services.session!.showingSubDate) else { return }
//        
//        if session % $0.subsShowSessionInterval == 0 && session != 1 {
//          self.showSubscription(source: .sessionStart, intent: .onStart)
//          
//        }
//        else if (session == $0.offerShowSessionInterval || ((session - $0.offerShowSessionInterval)  % $0.offerShowSessionRepeat == 0)) && session != 1 {
//          self.showSubscription(source: .bottomUpsell, intent: .additionInstant, session: session)
//        }
//      }
//    }
//  }
//  
//  func _showSubsScreen(source: Subs.Source, screen: Subs.Screen, intent: Subs.Intent, context: Subs.Context,
//                       from presenter: UIViewController? = nil,
//                       completion: (() -> Void)? = nil) {
//    DispatchQueue.main.async { [weak self] in
//      guard let self = self, !self.isPremium, let presenter = presenter ?? self.component.ui.presenter else { return }
//      
//      if context.sessionNumber == 0 {
//        self.manager.showSubsScreen(source: source, screen: screen, intent: intent, from: presenter)
//      }
//      else if context.sessionNumber == context.intervalNumber || ((context.sessionNumber - context.intervalNumber) % context.repeatNumber == 0) || context.sessionNumber == 1 {
//        self.manager.showSubsScreen(source: .bottomUpsell, screen: .additionalOffer, intent: .additionInstant, from: presenter)
//      }
//    }
//  }
//  
//  func _subsScreenViewController(source: Subs.Source, screen: Subs.Screen, intent: Subs.Intent,
//                                 completion: SubsCompletion? = nil) -> UIViewController {
//    manager.subsScreen(source: source, screen: screen, intent: intent, completion: completion)
//  }
//  
//}
//
//// MARK: - SubscriptionManager
//
//private class SubscriptionManager: NSObject {
//  
//  private class TransactionsObserver: NSObject, SKPaymentTransactionObserver {
//    
//    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) { }
//    
//    func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
//      return true
//    }
//    
//  }
//  
//  private enum Const {
//    static let requestMaxTryCount = 5
//    static let retryDelay = DispatchTimeInterval.seconds(1)
//    static let syncDelay = DispatchTimeInterval.seconds(1)
//    static let apiKey = "hkxinzYCpUJQbIlDqVxqZECZkzdoGZcB"
//  }
//  
//#if DEBUG
//  var debugPremium = false
//#endif
//  
//  var hasProducts: Bool { !products.isEmpty }
//  var isPremium: Bool {
//#if DEBUG
//    return debugPremium || premium
//#else
//    return premium
//#endif
//  }
//  
//  private var isLoadingProducts: Bool = false
//  private var isLoadingPurchaserInfo: Bool = false
//  private var productsRequestTry = 0
//  private var purchaserInfoTry = 0
//  
//  private weak var currentSubsScreen: Subs.ViewController?
//  private let transactionsObserver = TransactionsObserver()
//  
//  private var products: [SKProduct] = [] {
//    didSet { Notification.Subs.Update.post() }
//  }
//  
//  private var premium: Bool = false {
//    didSet {
//      if oldValue != premium {
//        Notification.Subs.Update.post()
//        Stored.isPremium = premium
//      }
//    }
//  }
//  
//  private let component: SubscriptionsComponent
//  typealias SubsCompletion = (Result) -> Void
//  
//  // MARK: - Init
//  
//  private override init() { preconditionFailure() }
//  
//  fileprivate init(component: SubscriptionsComponent) {
//    self.component = component
//    super.init()
//    Purchases.logLevel = isDebug ? .debug : .warn
//    Purchases.automaticAppleSearchAdsAttributionCollection = true
//    Purchases.configure(withAPIKey: Const.apiKey)
//    Purchases.shared.delegate = self
//    SKPaymentQueue.default().add(transactionsObserver)
//  }
//  
//  // MARK: - Public
//  // MARK: - UI
//  
//  func subsScreen(source: Subs.Source, screen: Subs.Screen, intent: Subs.Intent,
//                  completion: ((Result) -> Void)? = nil) -> Subs.ViewController {
//    let subsVC = component.view.viewController(for: screen, intent: intent, source: source)
//    subsVC.onClose = { [weak vc = subsVC, weak self] in
//      guard let self = self else { return }
//      guard let vc = vc else { return }
//      let presenter = vc
//      vc.dismiss(animated: true)
//      let showingSubDate = self.component.services.session?.showingSubDate
//      let sessionIdx = self.component.services.session?.currentSessionIdx
//      
//      self.component.config.data { context in
//        let shouldShowAdditionalOffer = screen != .additionalOffer && !self.premium && !Calendar.current.isDateInToday(showingSubDate!)
//        
//        guard shouldShowAdditionalOffer else {
//          completion?(.regular)
//          self.performPrepermissionChecks()
//          return
//        }
//        if screen != .additionalOffer && ((sessionIdx ?? 0) % context.offerShowSessionInterval == 0 || (((sessionIdx ?? 0) - context.offerShowSessionInterval) % context.offerShowSessionRepeat == 0) || sessionIdx == 1) {
//          vc.subs?.showSubscription(source: source, intent: intent, session: sessionIdx, from: presenter) {_ in
//            completion?(.regular)
//          }
//          self.performPrepermissionChecks()
//        }
//        else if screen == .additionalOffer && sessionIdx == context.offerShowSessionInterval {
//          self.performPrepermissionChecks()
//        }
//        
//        else if screen != .additionalOffer && sessionIdx != context.offerShowSessionInterval {
//          self.performPrepermissionChecks()
//        }
//      }
//      
//      completion?(.additionalOffer)
//    }
//    return subsVC
//  }
//  
//  func showSubsScreen(source: Subs.Source, screen: Subs.Screen, intent: Subs.Intent,
//                      from presenter: UIViewController, completion: (() -> Void)? = nil) {
//    if let current = currentSubsScreen {
//      if current.source == source,
//         current.intent == intent {
//        return
//      }
//      
//      hideCurrentSubsScreen(animated: true) { [weak self] in
//        self?.showSubsScreen(source: source, screen: screen, intent: intent,
//                             from: presenter, completion: completion)
//      }
//    }
//    
//    let subsVC = subsScreen(source: source, screen: screen, intent: intent) { [weak self] _ in
//      self?.currentSubsScreen = nil
//      completion?()
//    }
//    
//    currentSubsScreen = subsVC
//    subsVC.modalPresentationStyle = .overFullScreen
//    presenter.present(subsVC, animated: true)
//  }
//  
//  func hideCurrentSubsScreen(animated: Bool = true, completion: (() -> Void)? = nil) {
//    let current = currentSubsScreen
//    currentSubsScreen?.dismiss(animated: animated) { [weak self] in
//      if current == self?.currentSubsScreen {
//        self?.currentSubsScreen = nil
//      }
//      completion?()
//    }
//  }
//  
//  func performPrepermissionChecks() {
//    checkIDFAAccessIfNeeded()
//  }
//  
//  func checkIDFAAccessIfNeeded() {
//    if #available(iOS 14.5, *) {
//      requestAppTrackingTransparencyPermission()
//    }
//    else {
//      updateIDFAAttribute()
//    }
//  }
//  
//  func updateIDFAAttribute() {
//    let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
//    component.services.subs?.updateAttribute(.idfa(idfa))
//  }
//  
//  @available(iOS 14.5, *)
//  func requestAppTrackingTransparencyPermission(completion: (() -> Void)? = nil) {
//    //        if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
//    ATTrackingManager.requestTrackingAuthorization { [weak self] status in
//      if status == .authorized {
//        self?.updateIDFAAttribute()
//      }
//      switch status {
//      case .authorized:
//        self?.component.services.analytics?.sendEvent(.didCompleteATTRequest(status: .authorized))
//        FBAdSettings.setAdvertiserTrackingEnabled(true)
//      case .denied:
//        self?.component.services.analytics?.sendEvent(.didCompleteATTRequest(status: .denied))
//        FBAdSettings.setAdvertiserTrackingEnabled(false)
//      case .notDetermined:
//        self?.component.services.analytics?.sendEvent(.didCompleteATTRequest(status: .notDetermined))
//        FBAdSettings.setAdvertiserTrackingEnabled(false)
//      case .restricted:
//        self?.component.services.analytics?.sendEvent(.didCompleteATTRequest(status: .restricted))
//        FBAdSettings.setAdvertiserTrackingEnabled(false)
//      @unknown default: break
//      }
//      
//      //            completion?()
//    }
//    //        }
//  }
//  
//  // MARK: - Logic
//  
//  func syncIfNeeded() {
//    if !isLoadingPurchaserInfo {
//      purchaserInfoTry = 0
//      getPurchaserInfo()
//    }
//    
//    if !isLoadingProducts {
//      productsRequestTry = 0
//      getProductsInfo()
//    }
//  }
//  
//  enum PurchaseResult: Equatable {
//    case purchasing
//    case purchased(isTrial: Bool)
//    case restored(isTrial: Bool)
//    case failed
//    case deferred
//    case unknown
//  }
//  func purchase(product: SKProduct, source: Subs.Source, completion: ((PurchaseResult) -> Void)?) {
//    HUD.show()
//    Purchases.shared.purchaseProduct(product) { [weak self] transaction, purchaserInfo, error, _ in
//      defer {
//        HUD.dismiss()
//      }
//      guard let transaction = transaction, error == nil else {
//        completion?(.failed)
//        return
//      }
//      
//      let result: PurchaseResult
//      switch transaction.transactionState {
//      case .failed: result = .failed
//      case .deferred: result = .deferred
//      case .purchasing: result = .purchasing
//      case .purchased:
//        result = .purchased(isTrial: product.introductoryPrice?.paymentMode == .freeTrial)
//      case .restored:
//        result = .restored(isTrial: product.introductoryPrice?.paymentMode == .freeTrial)
//      @unknown default:
//        result = .unknown
//      }
//      
//      if let self = self {
//        let hasActiveEntitlement = purchaserInfo?.entitlements[product.productIdentifier]?.isActive == true
//        let isSuccessful = result.isAny(of: .purchased(isTrial: false), .purchased(isTrial: true),
//                                        .restored(isTrial: false), .restored(isTrial: true))
//        self.premium = hasActiveEntitlement || isSuccessful
//        if !hasActiveEntitlement {
//          self.schedulePurchaseSync()
//        }
//      }
//      completion?(result)
//    }
//  }
//  
//  func restore(block: ((RestoreResponseType) -> Void)?) {
//    HUD.show()
//    Purchases.shared.restoreTransactions { [weak self] purchaserInfo, error in
//      defer { HUD.dismiss() }
//      
//      guard error == nil else {
//        
//        block?(.error)
//        return
//      }
//      
//      if Subs.Product.allCases.contains(where: { purchaserInfo?.entitlements[$0.id]?.isActive == true }) {
//        self?.premium = true
//        block?(.success)
//      }
//      else {
//        block?(.noProducts)
//      }
//    }
//  }
//  
//  func productsList(for intent: Subs.Intent?) -> [SKProduct] {
//    switch intent {
//    case .normal:
//      return products.filter { $0.productIdentifier == Subs.Product.monthly.id }
//    case .onStart:
//      return products.filter { $0.productIdentifier == Subs.Product.monthly.id }
//    case .additionTrial:
//      return products.filter { $0.productIdentifier == Subs.Product.oneMonth_sevenDaysTrial.id }
//    case .additionInstant:
//      return products.filter { $0.productIdentifier == Subs.Product.threeMonths.id }
//    case .instant:
//      return products.filter { $0.productIdentifier == Subs.Product.quarterly.id }
//    case .trial:
//      return products.filter { $0.productIdentifier == Subs.Product.monthly.id }
//#if DEBUG
//    case .products(let products):
//      return self.products.filter { products.map(\.id).contains($0.productIdentifier) }
//#endif
//    case .none:
//      return self.products
//    }
//  }
//  
//}
//
//// MARK: - Private
//
//private extension SubscriptionManager {
//  
//  func getPurchaserInfo() {
//    purchaserInfoTry += 1
//    guard purchaserInfoTry <= Const.requestMaxTryCount else {
//      isLoadingPurchaserInfo = false
//      return
//    }
//    
//    isLoadingPurchaserInfo = true
//    Purchases.shared.purchaserInfo { [weak self] purchaserInfo, _ in
//      self?.handle(purchaserInfo: purchaserInfo)
//    }
//  }
//  
//  func getProductsInfo() {
//    productsRequestTry += 1
//    guard productsRequestTry <= Const.requestMaxTryCount else {
//      isLoadingProducts = false
//      return
//    }
//    isLoadingProducts = true
//    Purchases.shared.offerings { [weak self] offerings, _ in
//      
//      if let packages = offerings?.current?.availablePackages {
//        for package in packages {
//          self?.products.append(package.product)
//        }
//      }
//      
//      if let packages = offerings?.offering(identifier: "com.appstea.weather.add")?.availablePackages {
//        for package in packages {
//          self?.products.append(package.product)
//        }
//      }
//      self?.isLoadingProducts = false
//      
//    }
//  }
//  
//  func schedulePurchaseSync() {
//    DispatchQueue.main.asyncAfter(deadline: .now() + Const.syncDelay) { [weak self] in
//      self?.syncIfNeeded()
//    }
//  }
//  
//  func handle(purchaserInfo: Purchases.PurchaserInfo?) {
//    guard let purchaserInfo = purchaserInfo else {
//      premium = false
//      
//      DispatchQueue.main.asyncAfter(deadline: .now() + Const.retryDelay) { [weak self] in
//        self?.getPurchaserInfo()
//      }
//      return
//    }
//    
//    isLoadingPurchaserInfo = false
//    guard !purchaserInfo.entitlements.all.isEmpty else {
//      premium = false
//      return
//    }
//    
//    premium = Subs.Product.allCases.contains { purchaserInfo.entitlements[$0.id]?.isActive == true }
//  }
//  
//}
//
//// MARK: - PurchasesDelegate
//
//extension SubscriptionManager: PurchasesDelegate {
//  
//  func purchases(_ purchases: Purchases, didReceiveUpdated purchaserInfo: Purchases.PurchaserInfo) {
//    handle(purchaserInfo: purchaserInfo)
//  }
//  
//  func purchases(_ purchases: Purchases, shouldPurchasePromoProduct product: SKProduct,
//                 defermentBlock makeDeferredPurchase: @escaping RCDeferredPromotionalPurchaseBlock) {
//    makeDeferredPurchase { [weak self] _, info, _, _ in
//      self?.handle(purchaserInfo: info)
//    }
//  }
//  
//}
//
//
