//
//  Event.swift
//
//  Created by dDomovoj on 6/22/22.
//

import Foundation

public protocol IAnalyticsEvent {

  var name: String { get }
  var params: [String: Any]? { get }

}

public protocol IAnalyticsValue {

  var value: String { get }

}

