//
//  Base~View.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

public extension Base {

  class View: UIView {

    // MARK: - Init

    public override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }

    public required init?(coder: NSCoder) {
      super.init(coder: coder)
      setup()
    }

    // MARK: - Lifecycle

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
      setNeedsLayout()
    }

    // MARK: - Public

    public func setup() {
      backgroundColor = .clear
      translatesAutoresizingMaskIntoConstraints = true
      setNeedsLayout()
      setNeedsUpdateConstraints()
    }

  }
}
