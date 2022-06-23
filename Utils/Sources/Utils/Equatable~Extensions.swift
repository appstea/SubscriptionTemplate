//
//  Equatable~Extensions.swift
//
//  Created by dDomovoj on 6/16/22.
//

import Foundation

public extension Equatable {

  /// makes use of enumCase1.isAny(of: .enumCase1, .enumCase2) available
  func isAny(of candidates: Self...) -> Bool {
    candidates.contains(self)
  }

  func isNone(of candidates: Self...) -> Bool {
    !candidates.contains(self)
  }

}

public extension Optional where Wrapped: Equatable {

  /// makes use of optionalEnumCase1.isAny(of: .enumCase1, .enumCase2) available
  func isAny(of candidates: Wrapped...) -> Bool {
    map { candidates.contains($0) } ?? false
  }

}

public extension OptionSet {

  func containsAny(of members: Element...) -> Bool {
    members.contains(where: { self.contains($0) })
  }

}
