//
//  FirebaseService.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import Firebase
import FirebaseMessaging

final class FirebaseService: NSObject, UIApplicationDelegate {

  private lazy var messagingListener = MessagingListener()

  // MARK: - UIApplicationDelegate

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: LaunchOptions? = nil) -> Bool {
    Messaging.messaging().delegate = messagingListener
    FirebaseApp.configure()
    return true
  }

  func application(_ application: UIApplication,
                   didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
  }

}

// MARK: - MessagingListener

private class MessagingListener: NSObject, MessagingDelegate {

  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    if let fcmToken = fcmToken {
      // TODO: Later
//      subs.updateAttribute(.fcm($0)) }
    }
    NotificationCenter.default.post(name: Foundation.Notification.Name("FCMToken"),
                                    object: nil,
                                    userInfo: ["token": fcmToken as Any])
  }

}
