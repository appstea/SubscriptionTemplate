//
//  Analytics~Event.swift
//
//  Created by dDomovoj on 10/27/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation

import AnalyticsCraft

// MARK: - Public

extension Analytics.Service {

  func sendEvent(_ event: Analytics.Event) {
    send(event)
  }

}

extension Analytics {

  enum Event: IAnalyticsEvent {

    case sessionDetails(notificationStatus: NotificationsService.Status)

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
//    case orientationUsed(Orientation)

    var name: String {
      switch self {
      case .sessionDetails: return "Session Details"
//      case .orientationUsed: return "Orientation Used"
      }
    }

    var params: [String: Any]? {
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
          "Permission Notifications": value,
        ]
//      case .orientationUsed(let orientation):
//        return ["Orientation": orientation.value]
      }
    }

  }
}
