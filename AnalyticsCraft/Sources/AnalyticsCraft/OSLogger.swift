//
//  OSLogger.swift
//
//  Created by dDomovoj on 6/22/22.
//

import Foundation
import OSLog

public struct OSLogger: IAnalyticsLogger {

  public init() {}

  public func sendEventIfNeeded(_ event: IAnalyticsEvent) {
    let name = event.name
    let params = event.params?.description ?? "none"
    os_log("name: %{public}@ params: %{public}@", log: .analytics, type: .default, name, params)
  }

}

internal extension OSLog {

  /// Logs analytics events
  static let analytics = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "Undefined", category: "Analytics")

}

