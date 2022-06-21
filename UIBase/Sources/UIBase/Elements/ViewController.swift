//
//  ViewController.swift
//
//  Created by dDomovoj on 21/06/22.
//  Copyright © 2022 HomeMade. All rights reserved.
//

import UIKit

import CallbacksCraft

open class ViewController: UIViewController {

  public private(set) var onAppear = Callbacks()
  public private(set) var onDisappear = Callbacks()
  public private(set) var onLayout = Callbacks()
  public private(set) var onDeinit = Callbacks()

  public let lifetime = NSObject()

  open override var shouldAutorotate: Bool { true }

  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }

  open override var prefersStatusBarHidden: Bool { true }
//  open override var prefersHomeIndicatorAutoHidden: Bool { true }
  override open var preferredStatusBarStyle: UIStatusBarStyle {
    if #available(iOS 13.0, *) {
      return view.backgroundColor?.isLight == true ? .darkContent : .lightContent
    }
    else {
      return view.backgroundColor?.isLight == true ? .default : .lightContent
    }
  }

  // MARK: - Init

  deinit {
    onDeinit()
  }

  // MARK: - Lifecycle

  open override func loadView() {
    super.loadView()
    view.setNeedsUpdateConstraints()
    view.setNeedsLayout()
  }

  override open func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNeedsStatusBarAppearanceUpdate()
//    setNeedsUpdateOfHomeIndicatorAutoHidden()
  }

  open override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    onAppear()
  }

  open override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    onDisappear()
  }

  open override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    onLayout()
  }

}

fileprivate extension UIColor {

  var isLight: Bool {
    var (r,g,b,a) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
    getRed(&r, green: &g, blue: &b, alpha: &a)
    let l = (0.2126*r + 0.7152*g + 0.0722*b)
    return l >= 0.65
  }

}
