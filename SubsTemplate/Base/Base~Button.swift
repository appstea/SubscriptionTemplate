//
//  Base~UIKit.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

public extension Base {

  class Button: UIButton {

    public enum ContentLayout {
      case `default`
      case alignByEdges(spacing: CGFloat, padding: UIEdgeInsets)
    }

    open var contentLayout: ContentLayout = .default { didSet { setNeedsLayout() } }
    open var explicitIntrinsicContentSize: CGSize? { didSet { invalidateIntrinsicContentSize() } }

    override public init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }

    required public init?(coder: NSCoder) {
      super.init(coder: coder)
      setup()
    }

    // MARK: - Liecycle

    open override var intrinsicContentSize: CGSize {
      explicitIntrinsicContentSize ?? super.intrinsicContentSize
    }

    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
      hitArea().contains(point)
    }

    open override func contentRect(forBounds bounds: CGRect) -> CGRect {
      switch contentLayout {
      case .default: return super.contentRect(forBounds: bounds)
      case .alignByEdges(_, let padding):
        return bounds.inset(by: padding)
      }
    }

    open override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
      let result = super.titleRect(forContentRect: contentRect)
      switch contentLayout {
      case .default:
        return result
      case .alignByEdges(let spacing, _):
        let imageRect = self.imageRect(forContentRect: contentRect)
        if imageRect.isEmpty {
          return result
        }

        var width = contentRect.width - (imageRect.width + spacing)
        width = min(width, result.width)
        return CGRect(x: spacing, y: result.minY, width: width, height: result.height)
      }
    }

    open override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
      let result = super.imageRect(forContentRect: contentRect)
      switch contentLayout {
      case .default:
        return result
      case .alignByEdges:
        return CGRect(x: contentRect.maxX - result.width, y: result.minY,
                      width: result.width, height: result.height)
      }
    }

    // MARK: - Public

    open func setup() { }

  }

}
