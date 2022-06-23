//
//  SessionService.swift
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation
import UIKit

import Utils
import Stored
import NotificationCraft

extension Stored {

  @StorageKey("subscription.session.index", defaultValue: 0)
  fileprivate(set) static var sessionIdx: Int

}

extension Notification {

  enum Session {
    enum Change: INotification { typealias Data = Int }
  }

}

final class SessionService: AppService {

  var currentSessionIdx: Int { Stored.sessionIdx }

  static let current: SessionService? = SessionService()
  private override init() {
    super.init()
  }

  // MARK: - Lifecycle

  private func didBecomeActive() {
    incrementSession()
  }

  func applicationDidBecomeActive(_ application: UIApplication) { didBecomeActive() }
  func sceneDidBecomeActive(_ scene: UIScene) { didBecomeActive() }

}

// MARK: - Private

private extension SessionService {

  func incrementSession() {
    if Stored.didPassPrepermission {
      if Stored.sessionIdx == 0 {
        Stored.sessionIdx += 1
//        NSLog("SESSION idx: " + currentSessionIdx.description)
        Notification.Session.Change.post(currentSessionIdx)
      }
    }
  }
}
