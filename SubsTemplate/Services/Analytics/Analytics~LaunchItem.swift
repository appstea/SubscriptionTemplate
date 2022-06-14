//
//  Analytics~LaunchItem.swift
//
//  Created by dDomovoj on 11/12/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

enum LaunchItem {

  enum Notification {
    case local(UNNotificationRequest)
    case remote(UserInfo)
  }

  case `default`
  case notification(Notification)
  case location
  case shortcut(UIApplicationShortcutItem)
  case sourceApplication(bundleId: String)
  case userActivity(NSUserActivity)
  case userActivityType(String)
  case url(URL, OpenURLOptions?, annotation: Any?, sourceApplication: String?)

  // MARK: - Init

  init(url: URL, options: OpenURLOptions) {
    let annotation = options[UIApplication.OpenURLOptionsKey.annotation]
    let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
    self = .url(url, options, annotation: annotation, sourceApplication: sourceApplication)
  }

  init(launchOptions: LaunchOptions) {
    typealias Key = UIApplication.LaunchOptionsKey

    if let url = launchOptions[Key.url] as? URL {
      let annotation = launchOptions[Key.annotation]
      let sourceApplication = launchOptions[Key.sourceApplication] as? String
      NSLog("[LAUNCH OPTIONS] URL %@", url.absoluteString)
      NSLog("[LAUNCH OPTIONS] URL ANNOTATION \(annotation.debugDescription)")
      NSLog("[LAUNCH OPTIONS] URL SOURCE APP \(sourceApplication?.debugDescription ?? "None")")
      self = .url(url, nil, annotation: annotation, sourceApplication: sourceApplication)
      return
    }

    if let sourceApplication = launchOptions[Key.sourceApplication] as? String {
      NSLog("[LAUNCH OPTIONS] SOURCE APPLICATION %@", sourceApplication)
      self = .sourceApplication(bundleId: sourceApplication)
      return
    }

    if let shortcutItem = launchOptions[Key.shortcutItem] as? UIApplicationShortcutItem {
      NSLog("[LAUNCH OPTIONS] SHORTCUT ITEM %@", shortcutItem)
      self = .shortcut(shortcutItem)
      return
    }

    if let isFromLocation = launchOptions[Key.location] as? Bool, isFromLocation {
      NSLog("[LAUNCH OPTIONS] FROM LOCATION")
      self = .location
      return
    }

    if let remote = launchOptions[Key.remoteNotification] as? UserInfo {
      NSLog("[LAUNCH OPTIONS] REMOTE: %@", remote)
      self = .notification(.remote(remote))
      return
    }

    if let activity = launchOptions[Key.userActivityDictionary] as? [String: Any],
       let activityType = activity[Key.userActivityType.rawValue] as? String {
      NSLog("[LAUNCH OPTIONS] NSUserActivity %@", activity)
      self = .userActivityType(activityType)
      return
    }

    if let activityType = launchOptions[Key.userActivityType] as? String {
      NSLog("[LAUNCH OPTIONS] NSUserActivityType %@", activityType)
      self = .userActivityType(activityType)
      return
    }

    self = .default
  }

}
