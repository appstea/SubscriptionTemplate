//
//  SceneDelegate.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: windowScene)
      .with { UIService.shared?.start(from: $0) }
  }

}
