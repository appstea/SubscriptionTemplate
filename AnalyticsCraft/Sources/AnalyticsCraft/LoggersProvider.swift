//
//  LoggersProvider.swift
//
//  Created by dDomovoj on 6/22/22.
//

import Foundation

public protocol IAnalyticsLoggersProvider {

  func loggers() -> [IAnalyticsLogger?]

}

public struct DefaultLoggersProvider: IAnalyticsLoggersProvider {

  public func loggers() -> [IAnalyticsLogger?] { [OSLogger()] }

}
