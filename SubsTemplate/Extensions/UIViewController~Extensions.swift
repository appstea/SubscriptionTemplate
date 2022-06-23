//
//  UIViewController~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
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
