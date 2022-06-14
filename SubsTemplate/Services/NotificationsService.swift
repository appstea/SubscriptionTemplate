//
//  NotificationsService.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

//import Foundation
//import Alidade
//import Astrarium
//import NotificationCenter
//import RxSwift
//import RxSwiftExt
//import SwiftyUserDefaults
//
//extension UserStore {
//
//  @Stored("notifications.enabled", defaultValue: true)
//  var isNotificationsEnabled: Bool
//
//}
//
//final class NotificationsService {
//
//  var notificationCenter: UNUserNotificationCenter { .current() }
//
//  // MARK: - Lifecycle
//
//  func setup(with launchOptions: LaunchOptions) {
//    notificationCenter.delegate = notificationsListener
//    requestAuthorizationOnDemand()
//  }
//
//  func appDidBecomeActive() {
//    UIApplication.shared.applicationIconBadgeNumber = 0
//    notificationCenter.removeAllDeliveredNotifications()
//  }
//
//  // MARK: - Public
//
//  enum Status {
//    case silent
//    case allowed
//    case denied
//    case custom
//  }
//  func fetchStatus(completion: @escaping ((Status) -> Void)) {
//    authorization.asObservable().take(1).observe(on: MainScheduler.instance)
//      .subscribe(onNext: completion).disposed(by: disposeBag)
//  }
//
//}
//
//// MARK: - Private
//
//private extension NotificationsService {
//
//  func requestAuthorizationOnDemand() {
//    authorization.onDemand { sink in
//      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//      UIApplication.shared.applicationIconBadgeNumber = 0
//      UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { success, _ in
//        guard success else {
//          return sink(.denied)
//        }
//
//        DispatchQueue.main.async {
//          UIApplication.shared.registerForRemoteNotifications()
//          UNUserNotificationCenter.current().getNotificationSettings { settings in
//            if settings.soundSetting == .disabled && settings.badgeSetting == .disabled &&
//                settings.alertSetting == .disabled && settings.lockScreenSetting == .disabled &&
//                settings.alertStyle == .none {
//              sink(.silent)
//            }
//            else if settings.soundSetting == .enabled && settings.badgeSetting == .enabled &&
//                      settings.alertSetting == .enabled && settings.lockScreenSetting == .enabled &&
//                      settings.alertStyle != .none {
//              sink(.allowed)
//            }
//            else {
//              sink(.custom)
//            }
//          }
//        }
//      }
//    }
//  }
//
//}
