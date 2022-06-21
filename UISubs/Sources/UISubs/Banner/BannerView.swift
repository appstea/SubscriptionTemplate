//
//  UpgradeView.swift
//
//  Created by dDomovoj on 6/9/22.
//

import UIKit

import PinLayout

import UIBase

public final class BannerView: UIBase.View {

  private enum Const {
    static let bannerSize: CGSize = isPad ? CGSize(width: 728, height: 90) : CGSize(width: 320, height: 50)
  }

  private var banner: UIView?
  private let ctaButton = UIBase.Button()
  private lazy var defaultView = BannerView.DefaultView()

  public var onClick: (() -> Void)?

  // MARK: - Lifecycle

  public override func sizeThatFits(_ size: CGSize) -> CGSize {
    CGSize(width: size.width, height: Const.bannerSize.height)
  }
  public override var intrinsicContentSize: CGSize {
    CGSize(width: UIView.noIntrinsicMetric, height: Const.bannerSize.height)
  }

  public override func setup() {
    super.setup()
    isUserInteractionEnabled = true
    backgroundColor = .white
    clipsToBounds = true
    addSubview(defaultView)
    addSubview(ctaButton)
    ctaButton.addAction { [unowned self] _ in onClick?() }
  }

  public override func layoutSubviews() {
    super.layoutSubviews()

    defaultView.pin.hCenter().size(Const.bannerSize)
    if isPad {
      defaultView.pin.vCenter()
    }
    else {
      defaultView.pin.top()
    }
    ctaButton.pin.all()

    if let banner = banner {
      banner.pin.hCenter().size(Const.bannerSize)
      if isPad {
        banner.pin.vCenter()
      }
      else {
        banner.pin.top(-1.0 / UIScreen.main.scale)
      }
    }
  }

  // MARK: - Public

  public func setBanner(banner: UIView) {
    self.banner = banner

    ctaButton.isHidden = true
    defaultView.isHidden = true

    banner.removeFromSuperview()
    addSubview(banner)
  }

  public func removeBanner() {
    banner?.removeFromSuperview()
    banner = nil

    ctaButton.isHidden = false
    defaultView.isHidden = false
  }

}
