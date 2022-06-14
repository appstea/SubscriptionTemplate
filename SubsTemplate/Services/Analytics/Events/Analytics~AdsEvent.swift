//
//  Analytics~AdsEvent.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation

extension Analytics.Event {

  enum Ads: IAnalyticsEvent {

    enum ClickSource: IAnalyticsValue {
      case banner
      case interstitial

      var value: String {
        switch self {
        case .banner: return "Banner"
        case .interstitial: return "Interstitial"
        }
      }
    }
    case click(ClickSource)

    var name: String {
      switch self {
      case .click: return "Click Ad"
      }
    }

    var params: [String: Any]? {
      switch self {
      case .click(let source): return ["Source": source.value]
      }
    }

  }
}

extension Analytics.Service {

  func sendAdsEvent(_ event: Analytics.Event.Ads) { send(event) }

}
