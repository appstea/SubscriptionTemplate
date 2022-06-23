//
//  UIView~Extensions.swift
//
//  Created by dDomovoj on 6/14/22.
//

import UIKit

public extension UIView {

  func addSubviews(_ subviews: UIView...) {
    subviews.forEach {
      addSubview($0)
    }
  }

}
