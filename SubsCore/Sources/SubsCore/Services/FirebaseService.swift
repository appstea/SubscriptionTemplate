//
//  FirebaseService.swift
//
//  Created by dDomovoj on 6/14/22.
//

import UIKit

import Firebase
import FirebaseMessaging

final class FirebaseService: AppService {

  private lazy var messagingListener = MessagingListener()

  // MARK: - Init

  static let shared: FirebaseService? = FirebaseService()
  private override init() {
    super.init()
  }

  // MARK: - Lifecycle

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: LaunchOptions? = nil) -> Bool {
    FirebaseApp.configure()
    Messaging.messaging().delegate = messagingListener
    return true
  }

  func application(_ application: UIApplication,
                   didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
  }

}

// MARK: - MessagingListener

private class MessagingListener: NSObject, MessagingDelegate {

  private var subs: Subs.Service? { .shared }

  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    if let fcmToken = fcmToken {
      subs?.updateAttribute(.fcm(fcmToken))
    }
    NotificationCenter.default.post(name: Foundation.Notification.Name("FCMToken"),
                                    object: nil,
                                    userInfo: ["token": fcmToken as Any])
  }

}
