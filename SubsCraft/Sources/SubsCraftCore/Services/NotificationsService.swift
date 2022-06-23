//
//  NotificationsService.swift
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation
import NotificationCenter

import Stored

extension Stored {

  @StorageKey("subscription.notifications.enabled", defaultValue: true)
  static var isNotificationsEnabled: Bool

}

final class NotificationsService: AppService {

  var notificationCenter: UNUserNotificationCenter { .current() }

  private var status: Status?
  private var continuations: [CheckedContinuation<Status, Never>] = []

  static let shared: NotificationsService? = NotificationsService()
  private override init() {
    super.init()
  }

  // MARK: - Lifecycle

  func applicationDidBecomeActive(_ application: UIApplication) {
    application.applicationIconBadgeNumber = 0
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    UIApplication.shared.applicationIconBadgeNumber = 0
  }

  // MARK: - Public

  enum Status {
    case silent
    case allowed
    case denied
    case custom
  }
  func fetchStatus() async -> Status {
    if let status = status {
      return status
    }

    return await withCheckedContinuation { [weak self] c in
      guard let self = self else { return }

      if let status = self.status {
        c.resume(returning: status)
        return
      }

      let shouldRequest = self.continuations.isEmpty
      self.continuations.append(c)
      if shouldRequest {
        requestAuthorization()
      }
    }
  }

}

// MARK: - Private

private extension NotificationsService {

  func resumeContinuations(_ status: Status) {
    self.status = status
    continuations.forEach {
      $0.resume(returning: status)
    }
    continuations.removeAll()
  }

  func requestAuthorization() {
    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UIApplication.shared.applicationIconBadgeNumber = 0
    UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { [weak self] success, _ in
      guard success else {
        self?.resumeContinuations(.denied)
        return
      }

      DispatchQueue.main.async {
        UIApplication.shared.registerForRemoteNotifications()
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
          if settings.soundSetting == .disabled && settings.badgeSetting == .disabled &&
              settings.alertSetting == .disabled && settings.lockScreenSetting == .disabled &&
              settings.alertStyle == .none {
            self?.resumeContinuations(.silent)
          }
          else if settings.soundSetting == .enabled && settings.badgeSetting == .enabled &&
                    settings.alertSetting == .enabled && settings.lockScreenSetting == .enabled &&
                    settings.alertStyle != .none {
            self?.resumeContinuations(.allowed)
          }
          else {
            self?.resumeContinuations(.custom)
          }
        }
      }
    }
  }

}
