//
//  UIView~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import UIKit

extension UIView {

  func addSubviews(_ subviews: [UIView]) {
    subviews.forEach {
      addSubview($0)
    }
  }

  func addSubviews(_ subviews: UIView...) {
    subviews.forEach {
      addSubview($0)
    }
  }

  func fillSuperview() {
    guard let superview = superview else {
      return
    }

    translatesAutoresizingMaskIntoConstraints = false
    let attributes: [NSLayoutConstraint.Attribute] = [.width, .height, .top, .leading]
    attributes
      .map { NSLayoutConstraint(item: self, attribute: $0, relatedBy: .equal,
                                toItem: superview, attribute: $0, multiplier: 1.0, constant: 0.0) }
      .forEach { superview.addConstraint($0) }
  }

  func hierarchy() -> [UIView] { [self] + subviews.flatMap { $0.hierarchy() } }

  func superviews() -> [UIView] { [superview].compactMap { $0 } + (superview?.superviews() ?? []) }

  //    func addShadow(radius: CGFloat = 2.0, offset: CGSize = [2, 2], opacity: CGFloat = 0.6, color: UIColor = .black) {
  //        layer.shadowColor = color.cgColor
  //        layer.shadowRadius = radius
  //        layer.shadowOpacity = Float(opacity)
  //        layer.shadowOffset = offset
  //        layer.masksToBounds = false
  //    }

  func asAccessibilityElement(_ label: String? = nil, traits: UIAccessibilityTraits = .staticText) -> Self {
    with {
      $0.isAccessibilityElement = true
      $0.accessibilityTraits = traits
      if let label = label {
        $0.accessibilityLabel = label
      }
    }
  }

}
