//
//  Analytics~Service.swift
//
//  Created by dDomovoj on 10/23/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import UIKit

import Stored
import AnalyticsCraft

enum Analytics { }

public extension Config {

  struct Analytics {
    let isOSLogEnabled: Bool
    let isFirebaseEnabled: Bool
    let isBranchEnabled: Bool

    public init(isOSLogEnabled: Bool? = nil, isFirebaseEnabled: Bool? = nil, isBranchEnabled: Bool? = nil) {
      self.isOSLogEnabled = isOSLogEnabled ?? true
      self.isFirebaseEnabled = isFirebaseEnabled ?? true
      self.isBranchEnabled = isBranchEnabled ?? true
    }

  }
}

extension Analytics {

  struct LoggersProvider: IAnalyticsLoggersProvider {

    let config: Config.Analytics

    init(config: Config.Analytics) {
      self.config = config
    }

    func loggers() -> [IAnalyticsLogger?] {[
      config.isOSLogEnabled ? OSLogger() : nil,
      config.isFirebaseEnabled ? FirebaseService.shared.map { _ in FIRLogger() } : nil,
      config.isBranchEnabled ? BranchService.shared.map { _ in BranchLogger() } : nil,
    ]}

  }
}

extension Analytics {

  final class Service: AppService {

//    private let startAnalyticsOptions = Analytics.Event.Start.SourceOption.all
//      .subtracting(.default)
    private var didSendStartEventAtCurrentSession = false

    private let transmitter: Transmitter

    // MARK: - Init

    static var shared: Analytics.Service?
    init(config: Config.Analytics) {
      transmitter = Transmitter(provider: Analytics.LoggersProvider(config: config))
    }

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptions? = nil) -> Bool {
      transmitter.reload()
//      sendStartAnalyticsIfNeeded(Analytics.Event.Start(.init(launchOptions: launchOptions)))
      return true
    }

    private func didBecomeActive() {
      if Stored.didPassPrepermission {
        Task { [weak self] in
          if let status = await NotificationsService.shared?.fetchStatus() {
            self?.sendEvent(.sessionDetails(notificationStatus: status))
          }
        }
      }
    }

    func applicationDidBecomeActive(_ application: UIApplication) { didBecomeActive() }
    func sceneDidBecomeActive(_ scene: UIScene) { didBecomeActive() }

    private func didEnterBackground() {
      didSendStartEventAtCurrentSession = false
    }

    func applicationDidEnterBackground(_ application: UIApplication) { didEnterBackground() }
    func sceneDidEnterBackground(_ scene: UIScene) { didEnterBackground() }

//    func application(_ application: UIApplication,
//                     willContinueUserActivityWithType userActivityType: String) -> Bool {
//      sendStartAnalyticsIfNeeded(Analytics.Event.Start(.userActivityType(userActivityType)))
//      false
//    }
//
//    func application(_ application: UIApplication,
//                     continue userActivity: NSUserActivity,
//                     restorationHandler: @escaping RestorationHandler) -> Bool {
//      sendStartAnalyticsIfNeeded(Analytics.Event.Start(.userActivity(userActivity)))
//      false
//    }
//
//    func application(_ app: UIApplication, open url: URL,
//                     options: OpenURLOptions = [:]) -> Bool {
//      sendStartAnalyticsIfNeeded(Analytics.Event.Start(.init(url: url, options: options)))
//      false
//    }
//
//    func appDidReceive(_ notification: Astrarium.Notification) {
//      // TODO: include only on start notifications
//      switch notification {
//      case .local(let local):
//        NSLog("[LAUNCH OPTIONS] LOCAL DUPLICATE?: %@", local)
//      case .remote(let remote):
//        NSLog("[LAUNCH OPTIONS] REMOTE DUPLICATE?: %@", remote)
//        sendStartAnalyticsIfNeeded(Analytics.Event.Start(.notification(.remote(remote))))
//      }
//    }

    // MARK: - Public

    func send(_ event: IAnalyticsEvent) {
      transmitter.send(event)
    }

//    func sendStartLocalNotification(_ notification: LaunchItem.Notification) {
//      if case .local = notification {
//        sendStartAnalyticsIfNeeded(Analytics.Event.Start(.notification(notification)))
//      }
//    }

  }
}

// MARK: - Private

private extension Analytics.Service {

//  func sendStartAnalyticsIfNeeded(_ event: Analytics.Event.Start?) {
//    guard !didSendStartEventAtCurrentSession,
//          let event = event,
//          startAnalyticsOptions.contains(event.option) else { return }
//
//    send(event)
//    didSendStartEventAtCurrentSession = true
//  }

}
