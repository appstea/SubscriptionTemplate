//
//  DefaultBannerView.swift
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

import PinLayout

import UIBase
import UICommon
import SubsCraftResources

public extension BannerView {

  final class DefaultView: UIBase.View {

    private enum Const {
      static let upgradeLabelFontSize: CGFloat = 16
      static let upgradeViewHeight: CGFloat = 26
      static let upgradeLabelOffset: CGFloat = 10
      static let iconSize: CGFloat = 35
      static let leftOffset: CGFloat = 5
      static let titleLeftOffset: CGFloat = 10
    }

    public struct ViewModel {
      public var title = L10n.DefaultBanner.title
      public var titleColor = UIColor.black

      public var upgradeTitle = L10n.DefaultBanner.Upgrade.title
      public var upgradeTextColor = UIColor.black
      public var upgradeBackgroundColor = Color.Banner.cta.color

      public var icon = Asset.Banner.icon.image

      public init() { }

      fileprivate func apply(to view: DefaultView) {
        view.titleLabel.text = title
        view.titleLabel.textColor = titleColor

        view.upgradeLabel.text = upgradeTitle
        view.upgradeLabel.textColor = upgradeTextColor
        view.ctaButton.backgroundColor = upgradeBackgroundColor

        view.iconView.image = icon
      }

    }
    public var viewModel = ViewModel() {
      didSet { viewModel.apply(to: self) }
    }

    // MARK: UI

    fileprivate lazy var titleLabel: UIBase.Label = {
      let result = UIBase.Label()
      result.numberOfLines = 2
      result.setDynamicFont(font: .systemFont(ofSize: Const.upgradeLabelFontSize, weight: .medium))
      result.adjustsFontSizeToFitWidth = true
      result.minimumScaleFactor = isPad ? 0.5 : 0.75
      return result
    }()
    fileprivate let ctaButton: UIBase.View = {
      let result = UIBase.View()
      result.layer.cornerRadius = Const.upgradeViewHeight / 2
      return result
    }()
    fileprivate lazy var upgradeLabel: UIBase.Label = {
      let result = UIBase.Label()
      result.setContentCompressionResistancePriority(.required, for: .horizontal)
      result.dynamicFont = DynamicFont.medium(of: Const.upgradeLabelFontSize).maxSize(to: 22)
      return result
    }()
    fileprivate lazy var iconView: UIBase.ImageView = {
      let result = UIBase.ImageView()
      return result
    }()

    // MARK: - Lifecycle

    public override func setup() {
      super.setup()
      backgroundColor = .clear
      [
        iconView,
        ctaButton,
        titleLabel
      ].forEach { addSubview($0) }
      ctaButton.addSubview(upgradeLabel)
      viewModel.apply(to: self)
    }

    public override func layoutSubviews() {
      super.layoutSubviews()
      iconView.pin
        .start(Const.leftOffset).size(Const.iconSize)
        .vCenter()

      let w = upgradeLabel.sizeThatFits(bounds.size).width
      ctaButton.pin.vCenter()
        .end(Const.leftOffset)
        .height(Const.upgradeViewHeight)
        .width(w + Const.upgradeLabelOffset * 2.0)

      upgradeLabel.pin.vCenter().horizontally(Const.upgradeLabelOffset)
        .sizeToFit(.width)

      titleLabel.pin
        .top(to: iconView.edge.top)
        .bottom(to: iconView.edge.bottom)
        .start(to: iconView.edge.end).marginStart(Const.titleLeftOffset)
        .end(to: ctaButton.edge.start).marginEnd(-Const.titleLeftOffset)
    }

  }
}
