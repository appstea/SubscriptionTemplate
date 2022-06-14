//
//  Analytics~Event.swift
//
//  Created by dDomovoj on 10/27/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation

protocol IAnalyticsEvent {

  var name: String { get }
  var params: [String: Any]? { get }

}

protocol IAnalyticsValue {

  var value: String { get }

}

// MARK: - Public

extension Analytics.Service {

//  func sendEvent(_ event: Analytics.Event) {
//    send(event)
//  }

}

extension Analytics {

  enum Event { // IAnalyticsEvent {
//
//    case sessionDetails(notificationStatus: NotificationsService.Status, location: LocationManager.AuthorizationStatus)
//    case didCompleteTutorial
//
//    enum Orientation: IAnalyticsValue {
//      case portrait
//      case landscape
//
//      var value: String {
//        switch self {
//        case .portrait: return "Portrait"
//        case .landscape: return "Landscape"
//        }
//      }
//    }
//    case orientation(Orientation)
//    case didPerformSearch(query: String, searchResult: String?)
//
//    enum ATTRequestStatus {
//      case notDetermined
//      case restricted
//      case denied
//      case authorized
//    }
//    case didCompleteATTRequest(status: ATTRequestStatus)
//    case onboarding(Onboarding)
//
//    var name: String {
//      switch self {
//      case .sessionDetails: return "Session Details"
//      case .didCompleteTutorial: return "Tutorial Complete"
//      case .orientation: return "Orientation Used"
//      case .didPerformSearch: return "Search"
//      case .didCompleteATTRequest: return "ATT Request"
//      case .onboarding: return "Random Assignment"
//      }
//    }
//
//    var params: [AppEvents.ParameterName: Any]? {
//      switch self {
//      case .sessionDetails(let notification, let location):
//        let value: String
//        switch notification {
//        case .allowed: value = "Yes"
//        case .denied: value = "No"
//        case .silent: value = "Quiet"
//        case .custom: value = "Custom"
//        }
//        return [AppEvents.ParameterName("Permission Notifications"): value,
//                AppEvents.ParameterName("Permission Location"): location.rawValue(), ]
//      case .didCompleteTutorial: return nil
//      case .orientation(let orientation):
//        return [AppEvents.ParameterName("Orientation"): orientation.value]
//      case .didPerformSearch(let query, let searchResult):
//        return [AppEvents.ParameterName("Search Term"): query,
//                AppEvents.ParameterName("Chosen Result"): searchResult ?? "null", ]
//      case .didCompleteATTRequest(let status):
//        return [AppEvents.ParameterName("Granted"): status == .authorized ? "Yes" : "No"]
//      case .onboarding(let onboarding):
//        return [AppEvents.ParameterName("Onboarding"): onboarding.rawValue]
//      }
//    }

  }
}
