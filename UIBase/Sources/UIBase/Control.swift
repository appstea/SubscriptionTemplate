//
//  Control.swift
//
//  Created by dDomovoj on 21/06/22.
//  Copyright © 2022 HomeMade. All rights reserved.
//

import UIKit

open class Control: UIControl {
  
  open var proxy: UIControl? { nil }
  open var explicitIntrinsicContentSize: CGSize? { didSet { invalidateIntrinsicContentSize() } }
  
  open override var intrinsicContentSize: CGSize { explicitIntrinsicContentSize ?? super.intrinsicContentSize }
  
  // MARK: - Init
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  // MARK: - Overrides
  
  open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    hitArea().contains(point)
  }
  
  // MARK: Proxy
  
  override open func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
    if let proxy = proxy {
      proxy.addTarget(target, action: action, for: controlEvents)
    }
    else {
      super.addTarget(target, action: action, for: controlEvents)
    }
  }
  
  override open func addAction(for event: UIControl.Event = [.touchUpInside], block: @escaping UIControl.ActionBlock) {
    if let proxy = proxy {
      proxy.addAction(for: event, block: block)
    }
    else {
      super.addAction(for: event, block: block)
    }
  }
  
  override open func removeActions(for event: UIControl.Event = [.touchUpInside]) {
    if let proxy = proxy {
      proxy.removeActions(for: event)
    }
    else {
      super.removeActions(for: event)
    }
  }
  
  override open func removeTarget(_ target: Any?, action: Selector?, for controlEvents: UIControl.Event) {
    if let proxy = proxy {
      proxy.removeTarget(target, action: action, for: controlEvents)
    }
    else {
      super.removeTarget(target, action: action, for: controlEvents)
    }
  }
  
  open override func sendActions(for controlEvents: UIControl.Event) {
    if let proxy = proxy {
      proxy.sendActions(for: controlEvents)
    }
    else {
      super.sendActions(for: controlEvents)
    }
  }
  
  open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
    if let proxy = proxy {
      proxy.sendAction(action, to: target, for: event)
    }
    else {
      super.sendAction(action, to: target, for: event)
    }
  }
  
  // MARK: - Public
  
  open func setup() { }
  
}
