//
//  Subs~Service.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation

import StoreKit
import RevenueCat
//import AdSupport
//import iAd

import RevenueCat

import Utils
import NotificationCraft

public enum RestoreResponseType {
  case success
  case noProducts
  case error
}

public extension Config {

  struct Subs {
    let apiKey: String
    let offering: String
    let isDebug: Bool

    public struct URLs {
      let policy: String
      let terms: String
//      let store: String

      public init(policy: String, terms: String) {//} store: String) {
        self.policy = policy
        self.terms = terms
//        self.store = store
      }
    }
    let urls: URLs

    public init(apiKey: String, offering: String, isDebug: Bool, urls: URLs) {
      self.apiKey = apiKey
      self.offering = offering
      self.isDebug = isDebug
      self.urls = urls
    }
  }

}

// MARK: - Subs

extension Notification {

  enum Subs {

    enum Update: INotification { public typealias Data = Void }

  }

}

extension Subs {

  final class Service: AppService {

    enum Attribute {
      case idfa(String)
      case idfv(String)
      case apns(Data)
      case fcm(String)
      case fbAnonId(String)

      // swiftlint:disable:next nesting
      enum Branch {
        case mediaSource(String)
        case campaign(String)
        case adGroup(String)
        case ad(String)
        case keyword(String)
        case creative(String)
      }
      case branch(Branch)

//      case onboarding(Onboarding)
    }

    private let manager: PurchasesManager
    //
    var isPremium: Bool { manager.isPremium }
    var isDebugPremium: Bool {
      get { manager.debugPremium }
      set { manager.debugPremium = newValue }
    }

    static var shared: Subs.Service?
    init(config: Config) {
      manager = .init(config: config)
    }

    // MARK: - Lifecycle

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptions? = nil) -> Bool {
      observeSessions()
      if let idfv = UIDevice.current.identifierForVendor {
        updateAttribute(.idfv(idfv.uuidString))
      }
      return true
    }

    private func didBecomActive() { sync() }
    func applicationDidBecomeActive(_ application: UIApplication) { didBecomActive() }
    func sceneDidBecomeActive(_ scene: UIScene) { didBecomActive() }

    private func didEnterBackground() {
      manager.hideCurrentSubsScreen(animated: false)
    }
    func applicationDidEnterBackground(_ application: UIApplication) { didEnterBackground() }
    func sceneDidEnterBackground(_ scene: UIScene) { didEnterBackground() }

    func application(_ application: UIApplication,
                            didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      updateAttribute(.apns(deviceToken))
    }

    // MARK: - Public

    func updateAttribute(_ attribute: Attribute) {
      let purchases = Purchases.shared
      switch attribute {
      case .apns(let data): purchases.setPushToken(data)
      case .fcm(let token): purchases.setAttributes(["$fcmTokens": token])
      case .idfa(let id): purchases.setAttributes(["$idfa": id])
      case .idfv(let id): purchases.setAttributes(["$idfv": id])
      case .fbAnonId(let id): purchases.setFBAnonymousID(id)
      case .branch(let attribute):
        switch attribute {
        case .mediaSource(let source): purchases.setMediaSource(source)
        case .campaign(let campaign): purchases.setCampaign(campaign)
        case .adGroup(let group): purchases.setAdGroup(group)
        case .ad(let id): purchases.setAd(id)
        case .keyword(let keyword): purchases.setKeyword(keyword)
        case .creative(let id): purchases.setCreative(id)
        }
      }
    }

    public typealias SubsCompletion = () -> Void
    public func showSubscription(source: Subs.Source, intent: Subs.Intent,
                                 from presenter: UIViewController? = nil,
                                 completion: SubsCompletion? = nil) {
      guard let sessionIdx = SessionService.current?.currentSessionIdx else { return }

      DispatchQueue.main.async { [weak self] in
        let context = Context(sessionNumber: sessionIdx)
        self?._showSubsScreen(source: source, intent: intent, context: context) {
          completion?()
        }
      }
    }

    @MainActor
    func subsScreen(source: Subs.Source, intent: Subs.Intent,
                    completion: SubsCompletion? = nil) async -> Subs.ViewController {
      _subsScreenViewController(source: source, intent: intent, completion: completion)
    }

#if DEBUG
    func showSubscription(source: Subs.Source, screen: Subs.Screen, intent: Subs.Intent,
                          from presenter: UIViewController? = nil, completion: (() -> Void)? = nil) {
      guard let sessionIdx = SessionService.current?.currentSessionIdx else { return }

      let context = Context(sessionNumber: sessionIdx)
      _showSubsScreen(source: source, screen: screen, intent: intent, context: context, from: presenter, completion: completion)
    }
#endif

    func sync() {
      manager.syncIfNeeded()
    }

    func restore(completion: ((RestoreResponseType) -> Void)? = nil) {
      manager.restore(block: completion)
    }

    func hasProducts() -> Bool {
      manager.hasProducts
    }

    func productsList(for intent: Subs.Intent? = nil) -> [StoreProduct] {
      manager.productsList(for: intent)
    }

    func purchase(_ product: StoreProduct, intent: Subs.Intent, source: Subs.Source, block: ((Bool) -> Void)? = nil) {
      manager.purchase(product: product, source: source) { result in
        switch result {
        case .purchased: block?(true)
        default: break
        }
      }
    }

  }
}

// MARK: - Private

private extension Subs.Service {

  func observeSessions() {
//    Notification.Session.Change
//      .observe { [weak self] session in
//        guard let self = self,
//              !self.isPremium,
//              session > 0
//        else { return }
//
//        if session % $0.subsShowSessionInterval == 0 && session != 1 {
//          self.showSubscription(source: .sessionStart, intent: .onStart)
//
//        }
//        else if (session == $0.offerShowSessionInterval || ((session - $0.offerShowSessionInterval)  % $0.offerShowSessionRepeat == 0)) && session != 1 {
//          self.showSubscription(source: .bottomUpsell, intent: .additionInstant, session: session)
//        }
//      }
//      .bind(to: self)
  }

  func _showSubsScreen(source: Subs.Source, screen: Subs.Screen? = nil, intent: Subs.Intent, context: Subs.Context,
                       from presenter: UIViewController? = nil,
                       completion: (() -> Void)? = nil) {
    let screen = screen ?? .initial
    DispatchQueue.main.async { [weak self] in
      guard let self = self, !self.isPremium,
            let presenter = presenter ?? UIService.shared?.presenter
      else { return }

      self.manager.showSubsScreen(source: source, screen: screen, intent: intent, from: presenter)
    }
  }

  func _subsScreenViewController(source: Subs.Source, screen: Subs.Screen? = nil, intent: Subs.Intent,
                                 completion: SubsCompletion? = nil) -> Subs.ViewController {
    let screen = screen ?? .initial
    return manager.subsScreen(source: source, screen: screen, intent: intent, completion: completion)
  }

}
