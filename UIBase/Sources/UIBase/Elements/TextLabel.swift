//
//  TextLabel.swift
//
//  Created by dDomovoj on 21/06/22.
//  Copyright © 2022 HomeMade. All rights reserved.
//

import UIKit

public class TextLabel: View {

  private let storage: NSTextStorage
  private let layoutManager: NSLayoutManager
  private let container: NSTextContainer
  private let textView: UITextView

  // MARK: - Init

  convenience public init() {
    self.init(frame: .zero)
  }

  override public init(frame: CGRect) {
    let container = NSTextContainer(size: .zero)
    self.container = container

    let layoutManager = NSLayoutManager()
    layoutManager.addTextContainer(container)
    self.layoutManager = layoutManager

    let storage = NSTextStorage()
    storage.addLayoutManager(layoutManager)
    self.storage = storage

    let textView = UITextView(frame: .zero, textContainer: container)
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.isEditable = false
    textView.textContainerInset = .zero
    textView.backgroundColor = .clear
    self.textView = textView

    super.init(frame: frame)
    setup()
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Accessors

  public var text: String? {
    get { textView.text }
    set { textView.text = newValue }
  }

  public var font: UIFont? {
    get { textView.font }
    set { textView.font = newValue }
  }

  public var textColor: UIColor? {
    get { textView.textColor }
    set { textView.textColor = newValue }
  }

  public var textAlignment: NSTextAlignment {
    get { textView.textAlignment }
    set { textView.textAlignment = newValue }
  }

  public var attributedText: NSAttributedString? {
    get { textView.attributedText }
    set { textView.attributedText = newValue }
  }

  public var exclusionPaths: [UIBezierPath] {
    get { container.exclusionPaths }
    set { container.exclusionPaths = newValue }
  }

  // MARK: - Overrides

  override public var backgroundColor: UIColor? {
    get { super.backgroundColor }
    set { super.backgroundColor = newValue; textView.backgroundColor = newValue }
  }

  override public func sizeThatFits(_ size: CGSize) -> CGSize { textView.sizeThatFits(size) }

  override public var intrinsicContentSize: CGSize { textView.intrinsicContentSize }

  // MARK: - Lifecycle

  public override func setup() {
    super.setup()
    addSubview(textView)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    container.size = bounds.size
    textView.frame = bounds
  }

}
