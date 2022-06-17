//
//  UIService.swift
//
//  Created by dDomovoj on 06/15/22.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import UIKit

//import AVFoundation
import AppTrackingTransparency
import AdSupport

import Reachability

extension Stored {

  @StorageKey("stored.launch.index", defaultValue: 1)
  fileprivate(set) static var launchIdx: Int
}

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

    //        warmUpAudio()
    //        configure(intent: intent)
    if Stored.didPassPrepermission {
      Stored.launchIdx += 1
    }
    return true
  }

  func application(_ application: UIApplication,
                   supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    isPad ? .all : .portrait
  }

  // MARK: - Public

  func start(from window: UIWindow) {
    Task {
      self.window = window
      await start(from: window)
    }
  }

  // MARK: - Utils

  func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let firstAction = UIAlertAction(title: L10n.General.Button.ok, style: .cancel)
    alert.addAction(firstAction)

    presenter?.present(alert, animated: true)
  }

  func showShareView(items: [Any], sourceView: UIView?) {
    let alert = UIActivityViewController(activityItems: items, applicationActivities: [])
    if isPad {
      guard let sourceView = sourceView else { return }

      alert.popoverPresentationController?.sourceView = sourceView
    }

    alert.completionWithItemsHandler = { _, _, _, _ in }
    presenter?.present(alert, animated: true)
  }

  func checkInternetConnection() -> Bool {
    guard let connection = try? Reachability().connection else { return false }

    return connection.isAny(of: .wifi, .cellular)
  }

  //    func warmUpAudio() {
  //        let audioSession = AVAudioSession.sharedInstance()
  //        if audioSession.isOtherAudioPlaying {
  //            _ = try? audioSession.setCategory(.ambient, options: [.mixWithOthers])
  //            _ = try? audioSession.setActive(true, options: [.notifyOthersOnDeactivation])
  //        }
  //    }

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
    await showSubs(from: window)
    await checkIDFAAccessIfNeeded()
    await showMainScreen(from: window)
  }

  @MainActor
  func showSubs(from window: UIWindow) async {
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

  // MARK: - ATT check

  func checkIDFAAccessIfNeeded() async {
    if #available(iOS 14.5, *) {
      await requestAppTrackingTransparencyPermission()
    }
    else {
      updateIDFAAttribute()
    }
  }

  func updateIDFAAttribute() {
    let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
    Subs.Service.shared?.updateAttribute(.idfa(idfa))
  }

  @available(iOS 14.5, *)
  func requestAppTrackingTransparencyPermission() async {
    guard ATTrackingManager.trackingAuthorizationStatus == .notDetermined else { return }

    return await withCheckedContinuation { c in
      ATTrackingManager.requestTrackingAuthorization { [weak self] status in
        switch status {
        case .authorized:
          self?.updateIDFAAttribute()
//          analytics?.sendEvent(.didCompleteATTRequest(status: .authorized))
        case .denied:
//          analytics?.sendEvent(.didCompleteATTRequest(status: .denied))
          break
        case .notDetermined:
//          analytics?.sendEvent(.didCompleteATTRequest(status: .notDetermined))
          break
        case .restricted:
//          analytics?.sendEvent(.didCompleteATTRequest(status: .restricted))
          break
        @unknown default: break
        }
        c.resume(returning: ())
      }
    }
  }

}
