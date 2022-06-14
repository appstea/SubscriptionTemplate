//
//  Analytics~BranchEvent.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Branch

protocol IBranchAnalyticsEvent: IAnalyticsEvent {
  
  var data: BranchEvent? { get }
  
}

// MARK: - General

//extension Analytics.Event: IBranchAnalyticsEvent {
//
//    var data: BranchEvent? {
//        switch self {
//        case .didPerformSearch:
//            return .standardEvent(.search)
//        case .didCompleteTutorial:
//            return .standardEvent(.completeTutorial)
//        case .didCompleteATTRequest(let status):
//            Branch.getInstance().handleATTAuthorizationStatus(status.branchValue)
//            return nil
//        default: return nil
//        }
//    }
//
//}

// MARK: - Ads

//extension Analytics.Event.Ads: IBranchAnalyticsEvent {
//
//    var data: BranchEvent? {
//        switch self {
//        case .click(let source):
//            let event = BranchEvent.standardEvent(.clickAd)
//            switch source {
//            case .banner: event.adType = .banner
//            case .interstitial: event.adType = .interstitial
//            }
//            return event
//        }
//    }
//
//}

// MARK: - Subs

//extension Analytics.Event.Subs: IBranchAnalyticsEvent {
//
//    var data: BranchEvent? {
//        switch self {
//        case .selectProduct:
//            return .standardEvent(.initiatePurchase)
//        case .showUpsell: return nil
//        case .subscribe(_, _, _, let isTrial):
//            return !isTrial ? .standardEvent(.subscribe) : nil
//        }
//    }
//
//}

// MARK: - Subs.Trial

//extension Analytics.Event.Subs.Trial: IBranchAnalyticsEvent {
//
//    var data: BranchEvent? {
//        switch self {
//        case .start: return .standardEvent(.startTrial)
//        }
//    }
//
//}

// MARK: - Logger

extension Analytics {
  
  struct BranchLogger: IAnalyticsLogger {
    
    func sendEventIfNeeded(_ event: IAnalyticsEvent) {
      guard let event = (event as? IBranchAnalyticsEvent)?.data else { return }
      
      event.logEvent()
    }
    
  }
}

// MARK: - Private.ATTRequestStatus

//fileprivate extension Analytics.Event.ATTRequestStatus {
//  
//  var branchValue: UInt {
//    switch self {
//    case .notDetermined: return 0
//    case .restricted: return 1
//    case .denied: return 2
//    case .authorized: return 3
//    }
//  }
//  
//}
