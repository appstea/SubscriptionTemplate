//
//  _UIKit~Extensions.swift
//
//  Created by dDomovoj on 6/22/22.
//

import UIKit

extension UIViewController {

  var topMostController: UIViewController {
    if let presented = presentedViewController?.topMostController, !presented.isBeingDismissed {
      return presented
    }
    return self
  }

}

extension UIView {

  func asAccessibilityElement(_ label: String? = nil, traits: UIAccessibilityTraits = .staticText) -> Self {
    isAccessibilityElement = true
    accessibilityTraits = traits
    if let label = label {
      accessibilityLabel = label
    }
    return self
  }

  func addSubviews(_ subviews: UIView...) {
    subviews.forEach {
      addSubview($0)
    }
  }

}

extension CGSize {

  var aspectRatio: CGFloat { height != 0 ? width / height : 0.0 }

}

extension UIColor {

  func image() -> UIImage {
    defer { UIGraphicsEndImageContext() }

    let rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
    setFill()
    UIRectFill(rect)
    guard let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else { return UIImage() }

    return UIImage(cgImage: image)
  }

}
