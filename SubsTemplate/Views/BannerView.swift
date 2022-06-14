//
//  UpgradeView.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

final public class BannerView: Base.View {

  private var banner: UIView?
  private let ctaButton = Base.Button()
  private lazy var defaultView = BannerView.DefaultView()

  // MARK: - Init

  // MARK: - Public

}

//class UpgradeView: View {
//
//    enum Const {
//        static let bannerSize = isPad ? kAppodealUnitSize_728x90 : kAppodealUnitSize_320x50
//    }
//
//    public var onClick: (() -> Void)?
//
//    // MARK: UI
//
//    private let defaultBannerView = DefaultBannerView()
//    private let actionButton = UIButton()
//    private var banner: UIView?
//
//    // MARK: - Init
//
//    init() {
//        super.init(frame: .zero)
//        backgroundColor = Color.upgradeView.color
//        clipsToBounds = true
//        addSubview(defaultBannerView)
//        addSubview(actionButton)
//        actionButton.addTarget(self, action: #selector(actionClick), for: .touchUpInside)
//        setNeedsUpdateConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - Lifecycle
//
//    override func updateConstraints() {
//        defer { super.updateConstraints() }
//
//        defaultBannerView.snp.remakeConstraints {
//            $0.centerX.equalToSuperview()
//            if isPad {
//                $0.centerY.equalToSuperview()
//            }
//            else {
//                $0.top.equalToSuperview()
//            }
//            $0.size.equalTo(Const.bannerSize)
//        }
//        actionButton.snp.remakeConstraints { $0.edges.equalToSuperview() }
//    }
//
//    // MARK: - Public
//
//    func setBanner(banner: UIView) {
//        self.banner = banner
//
//        actionButton.isHidden = true
//        defaultBannerView.isHidden = true
//
//        banner.removeFromSuperview()
//        addSubview(banner)
//        banner.snp.remakeConstraints {
//            $0.centerX.equalToSuperview()
//            if isPad {
//                $0.centerY.equalToSuperview()
//            }
//            else {
//                $0.top.equalToSuperview().offset(1.0 / UIScreen.main.scale)
//            }
//            $0.size.equalTo(Const.bannerSize)
//        }
//    }
//
//    func removeBanner() {
//        banner?.removeFromSuperview()
//        banner = nil
//
//        actionButton.isHidden = false
//        defaultBannerView.isHidden = false
//    }
//
//}
//
//// MARK: - Actions
//
//@objc
//private extension UpgradeView {
//
//    func actionClick() {
//        onClick?()
//    }
//
//}
//
