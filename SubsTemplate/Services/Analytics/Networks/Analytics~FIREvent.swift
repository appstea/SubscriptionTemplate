//
//  Analytics~FIREvent.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import FirebaseAnalytics

protocol IFIRAnalyticsEvent: IAnalyticsEvent {

  var firName: String? { get }
  var firParams: [String: Any]? { get }

}

// MARK: - Subs

extension Analytics.Event.Subs: IFIRAnalyticsEvent {

  var firName: String? {
    switch self {
    case .upsellShown: return "Upsell_Shown"
    case .productSelected: return "Product_Selected"
    }
  }

  var firParams: [String: Any]? {
    switch self {
    case .upsellShown(let intent, let source):
      return ["Screen_ID": intent.value,
              "Source": source.value,]
    case .productSelected(let intent, let source, let productId):
      return ["Screen_ID": intent.value,
              "Source": source.value,
              "Product_ID": productId,]
    }
  }

}

// MARK: - General

extension Analytics.Event: IFIRAnalyticsEvent {

  var firName: String? {
    switch self {
    case .sessionDetails: return "Session_Details"
    case .orientationUsed: return "Orientation_Used"
    }
  }

  var firParams: [String: Any]? {
    switch self {
    case .sessionDetails(let notification):
      let value: String
      switch notification {
      case .allowed: value = "Yes"
      case .denied: value = "No"
      case .silent: value = "Quiet"
      case .custom: value = "Custom"
      }
      return [
        "Permission_Notifications": value,
      ]
    case .orientationUsed(let orientation):
      return ["Orientation": orientation.value]
    }
  }

}

// MARK: - Logger

extension Analytics {

  struct FIRLogger: IAnalyticsLogger {

    func sendEventIfNeeded(_ event: IAnalyticsEvent) {
      guard let event = event as? IFIRAnalyticsEvent,
            let firName = event.firName else { return }

      FirebaseAnalytics.Analytics.logEvent(firName, parameters: event.firParams)
    }

  }
}
