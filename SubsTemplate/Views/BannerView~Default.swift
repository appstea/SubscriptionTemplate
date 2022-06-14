//
//  DefaultBannerView.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

public extension BannerView {

  final class DefaultView: Base.View {

  }

}

//class DefaultBannerView: View {
//
//    private enum Const {
//        static let upgradeLabelFontSize: CGFloat = 16
//        static let upgradeViewHeight: CGFloat = 26
//        static let upgradeLabelOffset: CGFloat = 10
//        static let iconSize: CGFloat = 35
//        static let leftOffset: CGFloat = 5
//        static let titleLeftOffset: CGFloat = 10
//    }
//
//    // MARK: UI
//
//    private let titleLabel = UILabel {
//        $0.text = L10n.DefaultBanner.title
//        $0.numberOfLines = 2
//        $0.textColor = .white
//        $0.setDynamicFont(font: .systemFont(ofSize: Const.upgradeLabelFontSize, weight: .medium))
//        $0.adjustsFontSizeToFitWidth = true
//        $0.minimumScaleFactor = isPad ? 0.5 : 0.75
//    }
//    private let upgradeView = View {
//        $0.backgroundColor = Color.defaultBannerUpgrade.color
//        $0.layer.cornerRadius = Const.upgradeViewHeight / 2
//    }
//    private let upgradeLabel = Label {
//        $0.text = L10n.DefaultBanner.Upgrade.title
//        $0.textColor = .black
//        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
//        $0.dynamicFont = DynamicFont.medium(of: Const.upgradeLabelFontSize).maxSize(to: 22)
//    }
//    private let imageView = ImageView { $0.image = Asset.defaultBanner.image }
//
//    // MARK: - Lifecycle
//
//    override func setup() {
//        super.setup()
//        backgroundColor = .clear
//        addSubviews(imageView, upgradeView, titleLabel)
//        upgradeView.addSubview(upgradeLabel)
//    }
//
//    override func updateConstraints() {
//        defer { super.updateConstraints() }
//
//        imageView.snp.remakeConstraints {
//            $0.width.height.equalTo(Const.iconSize)
//            $0.left.equalTo(Const.leftOffset)
//            $0.centerY.equalToSuperview()
//        }
//        upgradeLabel.snp.remakeConstraints({
//            $0.centerY.equalToSuperview()
//            $0.leading.trailing.equalToSuperview().inset(Const.upgradeLabelOffset)
//        })
//        upgradeView.snp.remakeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.right.equalToSuperview().offset(-Const.leftOffset)
//            $0.height.equalTo(Const.upgradeViewHeight)
//            $0.width.greaterThanOrEqualTo(upgradeLabel).offset(Const.upgradeLabelOffset * 2.0)
//        }
//        titleLabel.snp.remakeConstraints({
//            $0.top.equalTo(imageView.snp.top)
//            $0.bottom.equalTo(imageView.snp.bottom)
//            $0.left.equalTo(imageView.snp.right).offset(Const.titleLeftOffset)
//            $0.right.equalTo(upgradeView.snp.left).offset(-Const.titleLeftOffset)
//        })
//    }
//
//}
//
