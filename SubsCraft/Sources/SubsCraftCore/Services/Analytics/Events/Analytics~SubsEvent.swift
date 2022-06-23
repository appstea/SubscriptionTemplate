//
//  Analytics~SubsEvent.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation

import AnalyticsCraft

typealias Subscription = Subs

extension Analytics.Event {

  enum Subs: IAnalyticsEvent {

    case upsellShown(intent: Subscription.Intent, source: Subscription.Source)
    case productSelected(intent: Subscription.Intent, source: Subscription.Source, productId: String)

    var name: String {
      switch self {
      case .upsellShown: return "Upsell Shown"
      case .productSelected: return "Product Selected"
      }
    }

    var params: [String: Any]? {
      switch self {
      case .upsellShown(let intent, let source):
        return [
          "Screen ID": intent.value,
          "Source": source.value,
        ]
      case .productSelected(let intent, let source, let productId):
        return [
          "Screen ID": intent.value,
          "Source": source.value,
          "Product ID": productId,
        ]
      }
    }

  }
}

// MARK: - Public

extension Analytics.Service {

  func sendSubsEvent(_ event: Analytics.Event.Subs) { send(event) }

}

// MARK: - Subs.Source

extension Subs.Source: IAnalyticsValue {

  public var value: String {
    switch self {
    case .onboarding: return "Onboarding"
    case .bottomUpsell: return "Bottom Upsell"
//    case .settings: return "Settings"
//    case .sessionStart: return "Session Start"
//    case .custom(let string): return string
#if DEBUG
    case .debug: return "DEBUG"
#endif
    }
  }

}

extension Subs.Intent: IAnalyticsValue {

  public var value: String {
    switch self {
    case .onStart: return "Initial"
    case .normal: return "Upsell"
#if DEBUG
    case .products: return "Custom"
#endif
//    case .additionTrial: return "Offer"
//    case .additionInstant: return "Offer"
//    case .instant: return "Custom"
//    case .trial: return "Custom"
    }
  }

}
