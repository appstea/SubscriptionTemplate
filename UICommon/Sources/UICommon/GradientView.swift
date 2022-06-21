//
//  GradientView.swift
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

import UIBase

// MARK: - Direction

public extension GradientView {

  struct Direction {

    public static let up = Direction(start: CGPoint(x: 0.5, y: 1.0), end: CGPoint(x: 0.5, y: 0.0))
    public static let down = Direction(start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
    public static let left = Direction(start: CGPoint(x: 1.0, y: 0.5), end: CGPoint(x: 0.0, y: 0.5))
    public static let right = Direction(start: CGPoint(x: 0.0, y: 0.5), end: CGPoint(x: 1.0, y: 0.5))

    public let start: CGPoint
    public let end: CGPoint

    public init(start: CGPoint, end: CGPoint) {
      self.start = CGPoint(x: min(max(0, start.x), 1), y: min(max(0, start.y), 1))
      self.end = CGPoint(x: min(max(0, end.x), 1), y: min(max(0, end.y), 1))
    }
  }

}

// MARK: - GradientView

public final class GradientView: UIBase.View {

  public var colors: [UIColor] = [.white, .black] { didSet { didUpdateColors() } }
  public var locations: [CGFloat] = [0, 1] { didSet { didUpdateColors() } }
  public var direction: Direction = .right { didSet { didUpdateDirection() } }

  private var gradientLayer: CAGradientLayer? { return layer as? CAGradientLayer }

  override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? { nil }
  override public class var layerClass: AnyClass { CAGradientLayer.self }

  override public func setup() {
    super.setup()
    backgroundColor = .clear
    didUpdateColors()
    didUpdateDirection()
  }

}

// MARK: - Private

private extension GradientView {

  func didUpdateColors() {
    gradientLayer?.colors = colors.map { $0.cgColor }
    gradientLayer?.locations = locations.map { NSNumber(value: Double($0)) }
    setNeedsDisplay()
  }

  func didUpdateDirection() {
    gradientLayer?.startPoint = direction.start
    gradientLayer?.endPoint = direction.end
    setNeedsDisplay()
  }

}
