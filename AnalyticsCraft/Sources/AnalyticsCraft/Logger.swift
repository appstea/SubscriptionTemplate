//
//  Analytics~Logger.swift
//
//  Created by dDomovoj on 12/2/20.
//

import Foundation

public protocol IAnalyticsLogger {

  func sendEventIfNeeded(_ event: IAnalyticsEvent)

}
