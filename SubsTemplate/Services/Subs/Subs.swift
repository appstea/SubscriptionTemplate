//
//  Subs.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation

enum Subs {

  static let policyString: String = "https://appstea.com/legal/privacy-policy/"
  static let termsString: String = "https://appstea.com/legal/terms-of-use/"
  static let appString: String = "https://apps.apple.com/us/app/id1533228338"

}

// MARK: - Intent

extension Subs {

  enum Intent: Equatable {
    case onStart
    case normal
    case additionTrial
    case additionInstant
    case instant
    case trial
#if DEBUG
    case products([Subs.Product])
#endif
  }

  enum Product: Equatable, CaseIterable {

    case quarterly
    case monthly
    case oneMonth_sevenDaysTrial
    case threeMonths
    case unlock

    var id: String {
      switch self {
      case .quarterly: return "com.appstea.weather.quarterly"
      case .monthly: return "com.appstea.weather.monthly"
      case .oneMonth_sevenDaysTrial: return "com.appstea.weather.1m_7dt"
      case .threeMonths: return "com.appstea.weather.3m"
      case .unlock: return "com.appstea.weather.unlock"
      }
    }
  }

}

// MARK: - Source

extension Subs {

  enum Source: Equatable {
    case onboarding
    case bottomUpsell
    case settings
    case sessionStart
    case custom(String)
#if DEBUG
    case debug
#endif
  }

}

// MARK: - Screen

extension Subs {

  enum Screen {
    /// one.button
    case oneButton

    /// two.buttons.aug21
    case twoButtons
    /// two.buttons
    case twoButtonsCombined

    /// one.button.houses
    case oneButtonHouses
    /// two.buttons.aug21.houses
    case twoButtonsHouses
    /// two.buttons.houses
    case twoButtonsHousesCombined

    /// two.buttons.map21
    case twoButtonsMap

    case additionalOffer
  }

}

// MARK: - Context

extension Subs {

  struct Context {
    var sessionNumber: Int
    var intervalNumber: Int
    var repeatNumber: Int
  }

}
