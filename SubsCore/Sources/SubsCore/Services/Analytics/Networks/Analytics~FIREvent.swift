//
//  Analytics~FIREvent.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import FirebaseAnalytics

import AnalyticsCraft

protocol IFIRAnalyticsEvent: IAnalyticsEvent {

  var firName: String? { get }
  var firParams: [String: Any]? { get }

}

fileprivate extension String {

  var firebaseKey: String {
    capitalized
      .components(separatedBy: " ")
      .joined(separator: "_")
  }

}

extension IFIRAnalyticsEvent {

  var firName: String? { name.firebaseKey }

  var firParams: [String: Any]? {
    guard let params = params, !params.isEmpty else { return nil }

    var result = [String: Any](minimumCapacity: params.count)
    params.forEach { key, value in
      result[key.firebaseKey] = value
    }
    return result
  }

}

// MARK: - Subs

extension Analytics.Event.Subs: IFIRAnalyticsEvent { }

// MARK: - General

extension Analytics.Event: IFIRAnalyticsEvent { }

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
