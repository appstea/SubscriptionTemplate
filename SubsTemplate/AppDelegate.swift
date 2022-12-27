//
//  AppDelegate.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

import Cascade

@main
final class AppDelegate: Cascade.AppDelegate {

  @objc
  override func targets() -> [UIApplicationDelegate] {[
    PaywallCore,
    UIService.shared,
  ].compactMap { $0 }}

  override func application(_ application: UIApplication,
                            configurationForConnecting connectingSceneSession: UISceneSession,
                            options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

}
