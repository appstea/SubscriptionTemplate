//
//  UIView~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import UIKit

extension UIView {

  func addSubviews(_ subviews: UIView...) {
    subviews.forEach {
      addSubview($0)
    }
  }

}
