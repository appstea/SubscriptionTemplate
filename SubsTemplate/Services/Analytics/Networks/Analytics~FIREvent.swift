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

//extension Analytics.Event.Subs: IFIRAnalyticsEvent {
//
//    var firName: String? {
//        switch self {
//        case .showUpsell: return "Upsell_Shown"
//        case .selectProduct: return "Product_Selected"
//        case .subscribe: return nil
//        }
//    }
//
//    var firParams: [String: Any]? {
//        switch self {
//        case .showUpsell(let intent, let source):
//            return ["Screen_ID": intent.value,
//                    "Source": source.value,]
//        case .selectProduct(let intent, let source, let productId):
//            return ["Screen_ID": intent.value,
//                    "Source": source.value,
//                    "Product_ID": productId,]
//        case .subscribe: return nil
//        }
//    }
//
//}

// MARK: - Ads

//extension Analytics.Event.Ads: IFIRAnalyticsEvent {
//
//    var firName: String? {
//        switch self {
//        case .click: return "Ad_Interaction"
//        }
//    }
//
//    var firParams: [String: Any]? {
//        switch self {
//        case .click(let source): return ["Source": source.value]
//        }
//    }
//
//}

// MARK: - Start

//extension Analytics.Event.Start: IFIRAnalyticsEvent {
//
//    var firName: String? {
//        switch self {
//        case .default: return "Start_from_Icon"
//        default: return "Start_Source"
//        }
//    }
//
//    var firParams: [String: Any]? {
//        let sourceKey = "Source"
//        switch self {
//        case .default: return nil
//        case .url(let urlString, let source):
//            guard let source = source else { return nil }
//
//            return [sourceKey: source, "Destination": urlString.prefix(100)]
//        case .widget(let widget): return [sourceKey: widget.value]
//        case .siri: return [sourceKey: "Siri Forecast"]
//        case .remote(let notification): return [sourceKey: "Push: \(notification)".prefix(100)]
//        case .local(let notification): return [sourceKey: "Local: \(notification)".prefix(100)]
//        case .source(let bundleId): return [sourceKey: "\(bundleId)"]
//        case .search: return [sourceKey: "Search"]
//        }
//    }
//
//}

// MARK: - General

//extension Analytics.Event: IFIRAnalyticsEvent {
//
//    var firName: String? {
//        switch self {
//        case .sessionDetails: return "Session_Details"
//        case .didCompleteTutorial: return "tutorial_complete"
//        case .orientation: return "Orientation_Used"
//        case .didPerformSearch: return "Search"
//        case .didCompleteATTRequest: return nil
//        case .onboarding: return "Random_Assignment"
//        }
//    }
//
//    var firParams: [String: Any]? {
//        switch self {
//        case .sessionDetails(let notification, let location):
//            let value: String
//            switch notification {
//            case .allowed: value = "Yes"
//            case .denied: value = "No"
//            case .silent: value = "Quiet"
//            case .custom: value = "Custom"
//            }
//            return ["Permission_Notifications": value,
//                    "Permission_Location": location.rawValue,]
//        case .didCompleteTutorial: return nil
//        case .orientation(let orientation):
//            return ["Orientation": orientation.value]
//        case .didPerformSearch(let query, let searchResult):
//            return ["search_term": query,
//                    "Chosen_Result": searchResult ?? "null",]
//        case .didCompleteATTRequest: return nil
//        case .onboarding(let onboarding):
//            return ["Onboarding": onboarding.rawValue]
//        }
//    }
//
//}

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
