//
//  Common~GradientView.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

// MARK: - GradientView.Direction

public extension Common.GradientView {

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

public extension Common {

  final class GradientView: UIView {

    public var colors: [UIColor] = [.white, .black] { didSet { didUpdateColors() } }
    public var locations: [CGFloat] = [0, 1] { didSet { didUpdateColors() } }
    public var direction: Direction = .right { didSet { didUpdateDirection() } }

    private var gradientLayer: CAGradientLayer? { return layer as? CAGradientLayer }

    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? { nil }
    override public class var layerClass: AnyClass { CAGradientLayer.self }

    public override init(frame: CGRect) {
      super.init(frame: frame)
      translatesAutoresizingMaskIntoConstraints = false
      setup()
    }

    required public init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      translatesAutoresizingMaskIntoConstraints = false
      setup()
    }

  }
}

// MARK: - Private

private extension Common.GradientView {

  func setup() {
    backgroundColor = .clear
    didUpdateColors()
    didUpdateDirection()
  }

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
