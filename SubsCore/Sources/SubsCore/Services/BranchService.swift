//
//  BranchService.swift
//
//  Created by dDomovoj on 6/14/22.
//

import Branch

final class BranchService: AppService {

  private var instance: Branch { .getInstance() }

  private var subs: Subs.Service? { .shared }

  // MARK: - Init

  static let shared: BranchService? = BranchService()
  private override init() {
    super.init()
  }

  // MARK: - Lifecycle

  func setup(with launchOptions: LaunchOptions) {
    instance.initSession(launchOptions: launchOptions) { [weak self] params, _ in
      if let params = params as? [String: Any],
         let campaign = params[BRANCH_INIT_KEY_CAMPAIGN] as? String {
        self?.subs?.updateAttribute(.branch(.campaign(campaign)))
      }
    }
  }

  func appContinue(userActivity: NSUserActivity, restorationHandler: @escaping RestorationHandler) -> Bool {
    instance.continue(userActivity)
    return false
  }

  func handle(url: URL, with options: OpenURLOptions) -> Bool {
    instance.application(.shared, open: url, options: options)
    return false
  }

  func appReadyFetchDataForRemoteNotification(with userInfo: UserInfo, fetchHandler: @escaping BackgroundFetchResultHandler) {
    instance.handlePushNotification(userInfo)
  }

}
