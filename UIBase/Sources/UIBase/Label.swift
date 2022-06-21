//
//  Label.swift
//
//  Created by dDomovoj on 21/06/22.
//  Copyright © 2022 HomeMade. All rights reserved.
//

import UIKit

open class Label: UILabel {
  
  public enum VerticalAlignment {
    case top
    case middle
    case bottom
  }
  
  open var padding: UIEdgeInsets = .zero { didSet { setNeedsDisplay() } }
  open var verticalAlignment: VerticalAlignment = .middle { didSet { setNeedsDisplay() } }
  
  // MARK: - Init
  
  convenience public init(padding: UIEdgeInsets) {
    self.init(frame: .zero)
    self.padding = padding
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: - Lifecycle
  
  override open func drawText(in rect: CGRect) {
    let rect = rect.inset(by: padding)
    if verticalAlignment == .middle {
      return super.drawText(in: rect)
    }
    
    let size = sizeThatFits(rect.size)
    if size.height >= rect.height {
      return super.drawText(in: rect)
    }
    
    let multiplier: CGFloat = verticalAlignment == .top ? 1.0 : -1.0
    let offset = (rect.height - size.height) * 0.5 * multiplier
    super.drawText(in: rect.offsetBy(dx: 0, dy: -offset))
  }
  
  override open var intrinsicContentSize: CGSize {
    var contentSize = super.intrinsicContentSize
    contentSize.height += padding.top + padding.bottom
    contentSize.width += padding.left + padding.right
    return contentSize
  }
  
  override open func sizeThatFits(_ size: CGSize) -> CGSize {
    let paddedSize = CGSize(width: size.width - (padding.left + padding.right),
                            height: size.height - (padding.top + padding.bottom))
    var contentSize = super.sizeThatFits(paddedSize)
    contentSize.height += padding.top + padding.bottom
    contentSize.width += padding.left + padding.right
    return contentSize
  }
  
  // MARK: - Public
  
  open func setup() { }
  
}
