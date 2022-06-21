//
//  DotLabel.swift
//
//  Created by dDomovoj on 6/17/22.
//

import UIKit

import TextCraft
import UIBase

public final class DotLabel: UIBase.View {

  public var text: NSAttributedString? { didSet { setNeedsDisplay() } }

  public var dotSize: CGFloat = 12 { didSet { setNeedsDisplay() } }
  public var dotPadding: CGFloat = 14 { didSet { setNeedsDisplay() } }
  public var dotColor: UIColor? { didSet { setNeedsDisplay() } }

  private var padding: UIEdgeInsets {
    isRTL
    ? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: dotSize + dotPadding)
    : UIEdgeInsets(top: 0, left: dotSize + dotPadding, bottom: 0, right: 0)
  }

  override public func sizeThatFits(_ size: CGSize) -> CGSize {
    if let lines = lines(in: CGRect(origin: .zero, size: size)), !lines.isEmpty {
      let result = lines.map { $0.frame(.useOpticalBounds) }
        .reduce(into: CGRect.zero) { $0 = $0.union($1) }
      return result.size
    }
    return size
  }

  // MARK: - Lifecycle

  override public func draw(_ rect: CGRect) {
    guard let text = text, let ctx = UIGraphicsGetCurrentContext() else { return }

    let rect = bounds.inset(by: padding)
    let frame = text.frame(in: rect)
    frame.draw(in: ctx)

    if let firstLineFrame = frame.lines().first?.frame(.useOpticalBounds) {
      ctx.saveGState()
      defer { ctx.restoreGState() }
      if isRTL {
        let dotCenter = CGPoint(x: firstLineFrame.maxX + dotSize, y: firstLineFrame.midY)
        let dotOrigin = CGPoint(x: dotCenter.x - (dotSize * 0.5), y: dotCenter.y - (dotSize * 0.5))
        let dotSize = CGSize(width: dotSize, height: dotSize)
        let dotRect = CGRect(origin: dotOrigin, size: dotSize)
        ctx.setFillColor((dotColor ?? .clear).cgColor)
        ctx.addEllipse(in: dotRect)
        ctx.fillPath()
      }
      else {
        let dotCenter = CGPoint(x: dotSize * 0.5, y: firstLineFrame.midY)
        let dotOrigin = CGPoint(x: dotCenter.x - (dotSize * 0.5), y: dotCenter.y - (dotSize * 0.5))
        let dotSize = CGSize(width: dotSize, height: dotSize)
        let dotRect = CGRect(origin: dotOrigin, size: dotSize)
        ctx.setFillColor((dotColor ?? .clear).cgColor)
        ctx.addEllipse(in: dotRect)
        ctx.fillPath()
      }
    }
  }

}

// MARK: - Private

private extension DotLabel {

  func lines(in bounds: CGRect) -> [TextCraft.Line]? {
    guard let text = text, !text.string.isEmpty else { return nil }

    let rect = CGRect(origin: .zero, size: bounds.inset(by: padding).size)
    return text.lines(in: rect)
  }

}

