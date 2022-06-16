//
//  Analytics~Service.swift
//
//  Created by dDomovoj on 10/23/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import UIKit

enum Analytics { }

extension Analytics {

  final class Service: AppService {

//    private let startAnalyticsOptions = Analytics.Event.Start.SourceOption.all
//      .subtracting(.default)
    private var didSendStartEventAtCurrentSession = false

    private lazy var loggers: [IAnalyticsLogger] = {
      let loggers: [IAnalyticsLogger?] = [
        (isDebug || isAdHoc) ? OSLogger() : nil,

//        component.services.firebase.map { _ in FIRLogger() },
//        component.services.branch.map { _ in BranchLogger() },
      ]
      return loggers.compactMap { $0 }
    }()

    static let shared: Analytics.Service? = Analytics.Service()
    private override init() {
      super.init()
    }

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptions? = nil) -> Bool {
      _ = loggers
//      sendStartAnalyticsIfNeeded(Analytics.Event.Start(.init(launchOptions: launchOptions)))
      return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      if Stored.didPassPrepermission {
//        component.services.notifications?.fetchStatus { [weak self] in
//          guard let self = self else { return }
//
//          let status = self.component.location.authorizationStatus
//          self.sendEvent(.sessionDetails(notificationStatus: $0, location: status))
//        }
      }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      didSendStartEventAtCurrentSession = false
    }

    func application(_ application: UIApplication,
                     willContinueUserActivityWithType userActivityType: String) -> Bool {
//      sendStartAnalyticsIfNeeded(Analytics.Event.Start(.userActivityType(userActivityType)))
      return false
    }

    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping RestorationHandler) -> Bool {
//      sendStartAnalyticsIfNeeded(Analytics.Event.Start(.userActivity(userActivity)))
      return false
    }

    func application(_ app: UIApplication, open url: URL,
                     options: OpenURLOptions = [:]) -> Bool {
//      sendStartAnalyticsIfNeeded(Analytics.Event.Start(.init(url: url, options: options)))
      return false
    }

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
      loggers.forEach {
        $0.sendEventIfNeeded(event)
      }
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
