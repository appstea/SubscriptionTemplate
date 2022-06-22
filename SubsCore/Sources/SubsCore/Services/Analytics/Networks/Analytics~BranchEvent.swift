//
//  Analytics~BranchEvent.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Branch

import AnalyticsCraft

protocol IBranchAnalyticsEvent: IAnalyticsEvent {
  
  var data: BranchEvent? { get }
  
}

// MARK: - Subs

extension Analytics.Event.Subs: IBranchAnalyticsEvent {

  var data: BranchEvent? {
    switch self {
    case .productSelected:
      return .standardEvent(.initiatePurchase)
    case .upsellShown: return nil
    }
  }

}

// MARK: - Logger

extension Analytics {
  
  struct BranchLogger: IAnalyticsLogger {
    
    func sendEventIfNeeded(_ event: IAnalyticsEvent) {
      guard let event = (event as? IBranchAnalyticsEvent)?.data else { return }
      
      event.logEvent()
    }
    
  }
}
