//
//  UIService.swift
//
//  Created by dDomovoj on 6/22/22.
//

import UIKit

//import AVFoundation
import AppTrackingTransparency
import AdSupport

import Reachability

import Stored
import UIBase
import SubsCraftResources

extension Stored {

  @StorageKey("subscription.launch.index", defaultValue: 1)
  fileprivate(set) static var launchIdx: Int

}

final class UIService: AppService {

  weak var window: UIWindow?
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
    if Stored.didPassPrepermission {
      Stored.launchIdx += 1
    }
    return true
  }

  // MARK: - Public

  func checkIDFAAccessIfNeeded() async {
    if #available(iOS 14.5, *) {
      await requestAppTrackingTransparencyPermission()
    }
    else {
      updateIDFAAttribute()
    }
  }

  func checkInternetConnection() -> Bool {
    (try? Reachability().connection)?.isAny(of: .wifi, .cellular) == true
  }

  func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let firstAction = UIAlertAction(title: L10n.General.Button.ok, style: .cancel)
    alert.addAction(firstAction)

    presenter?.present(alert, animated: true)
  }

//  func warmUpAudio() {
//    let audioSession = AVAudioSession.sharedInstance()
//    if audioSession.isOtherAudioPlaying {
//      _ = try? audioSession.setCategory(.ambient, options: [.mixWithOthers])
//      _ = try? audioSession.setActive(true, options: [.notifyOthersOnDeactivation])
//    }
//  }

}

// MARK: - Private

private extension UIService {

  // MARK: - ATT check

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

