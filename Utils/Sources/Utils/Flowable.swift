//
//  Flowable.swift
//
//  Created by dDomovoj on 6/16/22.
//

import Foundation

extension NSObject: Flowable, Initiable { }

public protocol Flowable { }
public protocol Initiable {

  init()
}

public extension Flowable where Self: Initiable {

  init(with constructor: (Self) -> Void) {
    self.init()
    constructor(self)
  }
}

public extension Flowable {

  @discardableResult
  func with(_ transformer: (Self) -> Void) -> Self {
    transformer(self)
    return self
  }

  func map<U>(_ transformer: (Self) throws -> U) rethrows -> U {
    try transformer(self)
  }
}

public extension Optional where Wrapped: Any {

  @discardableResult
  func with(_ transformer: (Wrapped) -> Void) -> Optional {
    flatMap { transformer($0) }
    return self
  }
}
