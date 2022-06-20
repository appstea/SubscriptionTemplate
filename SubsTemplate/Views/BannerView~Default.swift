//
//  DefaultBannerView.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

import PinLayout

public extension BannerView {

  final class DefaultView: Base.View {

    private enum Const {
      static let upgradeLabelFontSize: CGFloat = 16
      static let upgradeViewHeight: CGFloat = 26
      static let upgradeLabelOffset: CGFloat = 10
      static let iconSize: CGFloat = 35
      static let leftOffset: CGFloat = 5
      static let titleLeftOffset: CGFloat = 10
    }

    // MARK: UI

    private let titleLabel = UILabel {
      $0.text = L10n.DefaultBanner.title
      $0.numberOfLines = 2
      $0.textColor = .black
      $0.setDynamicFont(font: .systemFont(ofSize: Const.upgradeLabelFontSize, weight: .medium))
      $0.adjustsFontSizeToFitWidth = true
      $0.minimumScaleFactor = isPad ? 0.5 : 0.75
    }
    private let ctaButton = Base.View {
      $0.backgroundColor = Color.Banner.cta.color
      $0.layer.cornerRadius = Const.upgradeViewHeight / 2
    }
    private let upgradeLabel = Base.Label {
      $0.text = L10n.DefaultBanner.Upgrade.title
      $0.textColor = .black
      $0.setContentCompressionResistancePriority(.required, for: .horizontal)
      $0.dynamicFont = DynamicFont.medium(of: Const.upgradeLabelFontSize).maxSize(to: 22)
    }
    private let iconView = Base.ImageView { $0.image = Asset.Banner.icon.image }

    // MARK: - Lifecycle

    public override func setup() {
      super.setup()
      backgroundColor = .clear
      addSubviews(iconView, ctaButton, titleLabel)
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
