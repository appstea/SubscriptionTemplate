//
//  UIColor~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/16/22.
//

import UIKit

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
