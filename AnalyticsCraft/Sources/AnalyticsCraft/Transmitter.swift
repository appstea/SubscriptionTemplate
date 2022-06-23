//
//  Transmitter.swift
//
//  Created by dDomovoj on 6/22/22.
//

import Foundation

public final class Transmitter {

  let loggersProvider: IAnalyticsLoggersProvider
  lazy var loggers: [IAnalyticsLogger] = { loggersProvider.loggers().compactMap { $0 } }()

  // MARK: - Init

  public init() {
    loggersProvider = DefaultLoggersProvider()
  }

  public init(provider: IAnalyticsLoggersProvider) {
    loggersProvider = provider
  }

  // MARK: - Public

  public func reload() {
    loggers = loggersProvider.loggers().compactMap { $0 }
  }

  public func send(_ event: IAnalyticsEvent) {
    if Thread.isMainThread {
      loggers.forEach {
        $0.sendEventIfNeeded(event)
      }
    }
    else {
      DispatchQueue.main.async { [weak self] in
        self?.send(event)
      }
    }
  }

}
