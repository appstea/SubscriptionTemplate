//
//  UIService.swift
//
//  Created by dDomovoj on 06/15/22.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import UIKit

import PaywallCraftCore

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
      Paywall.core.keyWindow = window
      self.window = window

      if !Paywall.core.didPassPermissions {
        await Paywall.core.showPermissions(from: window)
        await Paywall.core.showPaywall(from: window)
        await Paywall.core.checkATT()
      }

      window.rootViewController = MainScreen.ViewController()
      window.makeKeyAndVisible()
    }
  }

}
