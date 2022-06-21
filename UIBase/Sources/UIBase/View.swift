//
//  View.swift
//
//  Created by dDomovoj on 21/06/22.
//  Copyright © 2022 HomeMade. All rights reserved.
//

import UIKit

open class View: UIView {

  // MARK: - Init

  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: - Lifecycle

  override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    setNeedsLayout()
  }

  // MARK: - Public

  open func setup() {
    backgroundColor = .clear
    translatesAutoresizingMaskIntoConstraints = true
    setNeedsLayout()
    setNeedsUpdateConstraints()
  }

}
