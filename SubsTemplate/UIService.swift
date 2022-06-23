//
//  UIService.swift
//
//  Created by dDomovoj on 06/15/22.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import UIKit

import UIBase

import Stored
import SubsCore

final class UIService: AppService {

  private var window: UIWindow?

  var presenter: UIViewController? {
    window?.rootViewController?.topMostController
  }

  // MARK: - Init

  static let shared: UIService? = UIService()
  private override init() {
    super.init()
  }

  // MARK: - Lifecycle

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: LaunchOptions? = nil) -> Bool {
    UI.setBaseWidths([.phone: 375, .pad: 768])
    return true
  }

  func application(_ application: UIApplication,
                   supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    isPad ? .all : .portrait
  }

  // MARK: - Public

  func start(from window: UIWindow) {
    Task {
      Subs.core.bind(window: window)
      self.window = window
      await start(from: window)
    }
  }

}

// MARK: - Private

private extension UIService {

  @MainActor
  func start(from window: UIWindow) async {
    if Stored.didPassPrepermission {
      await showMainScreen(from: window)
    }
    else {
      await showOnboarding(from: window)
    }
  }

  @MainActor
  func showMainScreen(from window: UIWindow) async {
    window.rootViewController = MainScreen.ViewController()
    window.makeKeyAndVisible()
  }

  @MainActor
  func showOnboarding(from window: UIWindow) async {
    let vc = Permissions.ViewController()
    window.rootViewController = vc
    window.makeKeyAndVisible()

    await vc.result()
    await Subs.core.showSubs(from: window)
    await Subs.core.checkIDFAAccessIfNeeded()
    await showMainScreen(from: window)
  }

}
