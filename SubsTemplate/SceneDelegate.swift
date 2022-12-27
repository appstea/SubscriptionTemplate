//
//  SceneDelegate.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

import Cascade

final class SceneDelegate: Cascade.SceneDelegate & UIWindowSceneDelegate {

  @objc
  override func targets() -> [UISceneDelegate] {[
    PaywallCore.scene,
    UIService.shared,
  ].compactMap { $0 }}

  var window: UIWindow?

  override func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
                      options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: windowScene)
      .with { UIService.shared?.start(from: $0) }
  }

}
