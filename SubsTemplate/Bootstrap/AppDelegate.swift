//
//  AppDelegate.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

protocol IApplicationService: UIApplicationDelegate { }

class AppService: NSObject, IApplicationService { }

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  @objc
  func services() -> [UIApplicationDelegate] {[
    Analytics.Service.shared,
    SessionService.current,
    FirebaseService.shared,
    UIService.shared,
    BranchService.shared,
    Subs.Service.shared,
    NotificationsService.shared,
  ].compactMap { $0 }}

  func application(_ application: UIApplication,
                   configurationForConnecting connectingSceneSession: UISceneSession,
                   options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

}
