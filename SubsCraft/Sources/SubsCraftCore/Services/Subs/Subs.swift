//
//  Subs.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation

import Stored

public enum Subs { }

extension Stored {

  @StorageKey("subscription.session.isPremium", defaultValue: false)
  static var isPremium: Bool

}

// MARK: - Intent

public extension Subs {

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

public extension Subs {

  enum Source: Equatable {
    case onboarding
    case bottomUpsell
#if DEBUG
    case debug
#endif
  }

}

// MARK: - Context

public extension Subs {

  struct Context {
    public var sessionNumber: Int
  }

}
