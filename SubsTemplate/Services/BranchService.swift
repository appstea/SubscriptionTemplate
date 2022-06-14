//
//  BranchService.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

//import Branch
//import Astrarium
//
//extension ServiceIds {
//
//    static let _branch = ServiceIdentifier<BranchService> { BranchService(component: __root.__branchComponent)  }
//    var branch: ServiceIdentifier<BranchService> { Self._branch }
//
//}
//
//final class BranchService: AppService {
//
//    private let component: BranchComponent
//    private var instance: Branch { .getInstance() }
//
//    // MARK: - Init
//
//    init() { preconditionFailure() }
//
//    fileprivate init(component: BranchComponent) {
//        self.component = component
//    }
//
//    // MARK: - Lifecycle
//
//    func setup(with launchOptions: LaunchOptions) {
//        instance.initSession(launchOptions: launchOptions) { [weak self] params, _ in
//            if let params = params as? [String: Any], let campaign = params[BRANCH_INIT_KEY_CAMPAIGN] as? String {
//                self?.component.subs?.updateAttribute(.branch(.campaign(campaign)))
//            }
//        }
//    }
//
//    func appContinue(userActivity: NSUserActivity, restorationHandler: @escaping RestorationHandler) -> Bool {
//        instance.continue(userActivity)
//        return false
//    }
//
//    func handle(url: URL, with options: OpenURLOptions) -> Bool {
//        instance.application(.shared, open: url, options: options)
//        return false
//    }
//
//    func appReadyFetchDataForRemoteNotification(with userInfo: UserInfo, fetchHandler: @escaping BackgroundFetchResultHandler) {
//        instance.handlePushNotification(userInfo)
//    }
//
//}
