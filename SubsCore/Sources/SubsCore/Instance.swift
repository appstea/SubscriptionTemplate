//
//  Instance.swift
//
//  Created by dDomovoj on 6/22/22.
//

import UIKit

import Cascade

public class Instance: Cascade.AppDelegate {

  @objc
  override public func targets() -> [UIApplicationDelegate] {[
    Analytics.Service.shared,
    SessionService.current,
    FirebaseService.shared,
    UIService.shared,
    BranchService.shared,
    Subs.Service.shared,
    NotificationsService.shared,
  ].compactMap { $0 }}

  // MARK: - Public

  public func checkIDFAAccessIfNeeded() async {
    await UIService.shared?.checkIDFAAccessIfNeeded()
  }

  @MainActor
  public func showSubs(from window: UIWindow) async {
    guard let subs = Subs.Service.shared, !subs.isPremium
    else {
      return
    }

    HUD.show()
    let vc = await Subs.Service.shared?.subsScreen(source: .onboarding, intent: .onStart)
    HUD.dismiss()
    window.rootViewController = vc
    window.makeKeyAndVisible()

    await vc?.result()
  }

  public func bind(window: UIWindow) {
    UIService.shared?.window = window
  }

}
