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

  func addChildViewController(_ childViewController: UIViewController, containerView: UIView, animated: Bool) {
    addChild(childViewController)
    childViewController.beginAppearanceTransition(true, animated: animated)
    containerView.addSubview(childViewController.view)
    childViewController.view.fillSuperview()
    childViewController.didMove(toParent: self)
    if !animated {
      childViewController.endAppearanceTransition()
    }
  }

}
