//
//  Analytics~SubsEvent.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation

extension Analytics.Event {

//  enum Subs: IAnalyticsEvent {
//
//    case showUpsell(intent: Climate.Subs.Intent, source: Climate.Subs.Source)
//    case selectProduct(intent: Climate.Subs.Intent, source: Climate.Subs.Source, productId: String)
//    case subscribe(intent: Climate.Subs.Intent, source: Climate.Subs.Source, productId: String, isTrial: Bool)
//
//    var name: String {
//      switch self {
//      case .showUpsell: return "Upsell Shown"
//      case .selectProduct: return "Product Selected"
//      case .subscribe: return "User Subscribed"
//      }
//    }
//
//    var params: [AppEvents.ParameterName: Any]? {
//      switch self {
//      case .showUpsell(let intent, let source):
//        return [AppEvents.ParameterName("Screen ID"): intent.value,
//                AppEvents.ParameterName("Source"): source.value, ]
//      case .selectProduct(let intent, let source, let productId):
//        return [AppEvents.ParameterName("Screen ID"): intent.value,
//                AppEvents.ParameterName("Source"): source.value,
//                AppEvents.ParameterName("Product ID"): productId, ]
//      case .subscribe(let intent, let source, let productId, let isTrial):
//        return [AppEvents.ParameterName("Screen ID"): intent.value,
//                AppEvents.ParameterName("Source"): source.value,
//                AppEvents.ParameterName("Product ID"): productId,
//                AppEvents.ParameterName("Trial"): isTrial ? "Yes" : "No", ]
//      }
//    }
//
//  }
//}
//
//extension Analytics.Event.Subs {
//
//  enum Trial: IAnalyticsEvent {
//    case start
//
//    var name: String {
//      switch self {
//      case .start: return "Start Trial"
//      }
//    }
//
//    var params: [AppEvents.ParameterName: Any]? { nil }
//
//  }
//}
//
//// MARK: - Public
//
//extension Analytics.Service {
//
//  func sendSubsEvent(_ event: Analytics.Event.Subs) { send(event) }
//  func sendSubsTrialEvent(_ event: Analytics.Event.Subs.Trial) { send(event) }
//
//}
//
//// MARK: - Subs.Source
//
//extension Subs.Source: IAnalyticsValue {
//
//  var value: String {
//    switch self {
//    case .onboarding: return "Onboarding"
//    case .bottomUpsell: return "Bottom Upsell"
//    case .settings: return "Settings"
//    case .sessionStart: return "Session Start"
//    case .custom(let string): return string
//#if DEBUG
//    case .debug: return "DEBUG"
//#endif
//    }
//  }
//
//}
//
//extension Subs.Intent: IAnalyticsValue {
//
//  var value: String {
//    switch self {
//    case .onStart: return "Initial"
//    case .normal: return "Upsell"
//#if DEBUG
//    case .products: return "Custom"
//#endif
//    case .additionTrial: return "Offer"
//    case .additionInstant: return "Offer"
//    case .instant: return "Custom"
//    case .trial: return "Custom"
//    }
//  }

}
