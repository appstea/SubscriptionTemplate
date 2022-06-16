//
//  TimeInterval~Extension.swift
//
//  Created by dDomovoj on 2/3/21.
//  Copyright © 2021 AppsTea. All rights reserved.
//

import Foundation

extension TimeInterval {

  static let second = TimeInterval(1)
  static let minute = 60 * second
  static let hour = 60 * minute
  static let day = 24 * hour
  static let week = 7 * day

  var nanoseconds: UInt64 {
    UInt64((self * 1_000_000_000).rounded())
  }

}
