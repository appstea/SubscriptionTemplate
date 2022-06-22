//
//  DefaultBannerView.swift
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

import PinLayout

import UIBase
import UICommon
import SubsResources

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

    // MARK: UI

    private let titleLabel: UIBase.Label = {
      let result = UIBase.Label()
      result.text = L10n.DefaultBanner.title
      result.numberOfLines = 2
      result.textColor = .black
      result.setDynamicFont(font: .systemFont(ofSize: Const.upgradeLabelFontSize, weight: .medium))
      result.adjustsFontSizeToFitWidth = true
      result.minimumScaleFactor = isPad ? 0.5 : 0.75
      return result
    }()
    private let ctaButton: UIBase.View = {
      let result = UIBase.View()
      result.backgroundColor = Color.Banner.cta.color
      result.layer.cornerRadius = Const.upgradeViewHeight / 2
      return result
    }()
    private let upgradeLabel: UIBase.Label = {
      let result = UIBase.Label()
      result.text = L10n.DefaultBanner.Upgrade.title
      result.textColor = .black
      result.setContentCompressionResistancePriority(.required, for: .horizontal)
      result.dynamicFont = DynamicFont.medium(of: Const.upgradeLabelFontSize).maxSize(to: 22)
      return result
    }()
    private let iconView: UIBase.ImageView = {
      let result = UIBase.ImageView()
      result.image = Asset.Banner.icon.image
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
