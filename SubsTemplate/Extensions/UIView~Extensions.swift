//
//  UIView~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import UIKit

extension UIView {

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

}

