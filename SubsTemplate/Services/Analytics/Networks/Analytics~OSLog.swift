//
//  Analytics~NSLog.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation
import OSLog

extension Analytics {

  struct OSLogger: IAnalyticsLogger {

    func sendEventIfNeeded(_ event: IAnalyticsEvent) {
      let name = event.name
      let params = event.params?.description ?? "none"
      os_log("name: %{public}@ params: %{public}@", log: .analytics, type: .default, name, params)
    }

  }
}

extension OSLog {

  /// Logs analytics events
  static let analytics = OSLog(subsystem: Const.Bundle.current, category: "Analytics")
  
}
