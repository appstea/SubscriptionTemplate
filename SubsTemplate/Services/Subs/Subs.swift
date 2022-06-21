//
//  Subs.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation

import Stored

enum Subs {

  static let policyString: String = "https://appstea.com/legal/privacy-policy/"
  static let termsString: String = "https://appstea.com/legal/terms-of-use/"
   // TODO: Replace Later
  static let appString: String = "https://apps.apple.com/us/app/id1533228338"

}

extension Stored {

  @StorageKey("stored.session.isPremium", defaultValue: false)
  static var isPremium: Bool

}

// MARK: - Intent

extension Subs {

  enum Intent: Equatable {
    case onStart
    case normal
#if DEBUG
    case products([Subs.Product])
#endif
  }

  enum Product: Equatable, CaseIterable {

    /// yearly - no trial
    case yearly
    /// monthly - comes with 3 days trial
    case monthly

    var id: String {
      switch self {
      case .yearly: return "com.appstea.proto.1y"
      case .monthly: return "com.appstea.proto.1m"
      }
    }
  }

}

// MARK: - Source

extension Subs {

  enum Source: Equatable {
    case onboarding
    case bottomUpsell
#if DEBUG
    case debug
#endif
  }

}

// MARK: - Context

extension Subs {

  struct Context {
    var sessionNumber: Int
  }

}
