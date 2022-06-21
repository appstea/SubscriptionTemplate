//
//  AppDelegate.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

import Cascade

protocol IApplicationService: UIApplicationDelegate { }

class AppService: NSObject, IApplicationService { }

final class SubsSDKAppDelegate: Cascade.AppDelegate {

  @objc
  override func targets() -> [UIApplicationDelegate] {[
    Analytics.Service.shared,
    SessionService.current,
    FirebaseService.shared,
    UIService.shared,
    BranchService.shared,
    Subs.Service.shared,
    NotificationsService.shared,
  ].compactMap { $0 }}

}

@main
final class AppDelegate: Cascade.AppDelegate {

  private let sdk = SubsSDKAppDelegate()

  @objc
  override func targets() -> [UIApplicationDelegate] {[
    sdk,
  ].compactMap { $0 }}

  override func application(_ application: UIApplication,
                            configurationForConnecting connectingSceneSession: UISceneSession,
                            options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

}
