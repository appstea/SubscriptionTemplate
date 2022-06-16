//
//  DeinitObserver.swift
//
//  Created by dDomovoj on 9/13/21.
//  Copyright © 2021 AppsTea. All rights reserved.
//

import Foundation

private enum OnDeinitKeys {
    static var onDeinit: UInt = 0
}

protocol Deinitable: AnyObject { }
extension NSObject: Deinitable { }

extension Deinitable {

  fileprivate var deinitObserver: DeinitObserver? {
    get { objc_getAssociatedObject(self, &OnDeinitKeys.onDeinit) as? DeinitObserver }
    set { objc_setAssociatedObject(self, &OnDeinitKeys.onDeinit, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }

  var onDeinit: Callbacks {
    get {
      if let observer = deinitObserver {
        return observer.callbacks
      }
      let deinitObserver = DeinitObserver(callbacks: Callbacks())
      self.deinitObserver = deinitObserver
      return deinitObserver.callbacks
    }
    set {
      if let observer = deinitObserver {
        observer.callbacks = newValue
      }
      else {
        deinitObserver = .init(callbacks: newValue)
      }
    }
  }

}

private final class DeinitObserver {

  var callbacks: Callbacks

  // MARK: - Init

  init(callbacks: Callbacks) {
    self.callbacks = callbacks
  }

  deinit { callbacks() }

}
