//
//  UIService.swift
//
//  Created by dDomovoj on 06/15/22.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import UIKit

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
                   supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    UIDevice.current.userInterfaceIdiom == .pad ? .all : .portrait
  }

  // MARK: - Public

  func start(from window: UIWindow) {
    Task { @MainActor in
      Subs.core.keyWindow = window
      self.window = window
      await start(from: window)
    }
  }

}

// MARK: - Private

private extension UIService {

  @MainActor
  func start(from window: UIWindow) async {
    if !Subs.core.didPassPermissions {
      await Subs.core.showPermissions(from: window)
      await Subs.core.showSubs(from: window)
      await Subs.core.checkIDFAAccessIfNeeded()
    }
    await showMainScreen(from: window)
  }

  @MainActor
  func showMainScreen(from window: UIWindow) async {
    window.rootViewController = MainScreen.ViewController()
    window.makeKeyAndVisible()
  }

}
