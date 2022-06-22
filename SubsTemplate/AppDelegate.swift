//
//  AppDelegate.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

import Cascade
import SubsCore

enum Subs {

   static let core = SubsCore.Instance()

}

@main
final class AppDelegate: Cascade.AppDelegate {

  @objc
  override func targets() -> [UIApplicationDelegate] {[
    Subs.core,
    UIService.shared,
  ].compactMap { $0 }}

  override func application(_ application: UIApplication,
                            configurationForConnecting connectingSceneSession: UISceneSession,
                            options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

}
