//
//  BannerConstructor.swift
//
//  Created by dDomovoj on 6/21/22.
//

import Foundation
import UIKit

import SubsUI
import NotificationCraftSystem

public struct BannerConstructor {

  public struct ShowCtx {
    let source: Subs.Source
    let intent: Subs.Intent
    let presenter: UIViewController

    public init(source: Subs.Source, intent: Subs.Intent, presenter: UIViewController) {
      self.source = source
      self.intent = intent
      self.presenter = presenter
    }
  }

  public let showContext: () -> (ShowCtx)

  public func build() -> BannerView {
    let result = BannerView()
    result.onClick = {
      let ctx = showContext()
//      Subs.Service.shared?.showSubscription(source: .bottomUpsell, intent: .normal, from: self)
      Subs.Service.shared?.showSubscription(source: ctx.source, intent: ctx.intent, from: ctx.presenter)
    }

    addObservers(to: result)

    return result
  }

  // MARK: - Init

  public init(_ showCtxProvider: @escaping () -> (ShowCtx)) {
    showContext = showCtxProvider
  }

  // MARK: - Private

}

// MARK: - Private

private extension BannerConstructor {

  func addObservers(to bannerView: BannerView) {
    [
      Notification.Subs.Update.observe { [weak bannerView] in self.updateBannerIfNeeded(in: bannerView) },
      Notification.System.DidBecomeActive.observe { [weak bannerView] in self.loadBanner(in: bannerView) },
      Notification.System.DidEnterBackground.observe { [weak bannerView] in self.removeBanner(from: bannerView) },
      Notification.System.WillResignActive.observe { [weak bannerView] in self.removeBanner(from: bannerView) },
    ].forEach { $0.bind(to: bannerView) }

    bannerView.onMoveToSuperview.add { [weak bannerView] in
      self.updateBannerIfNeeded(in: bannerView)
    }.bindLifetime(to: bannerView)
  }

  func updateBannerIfNeeded(in bannerView: BannerView?) {
    if SubsCore.Subs.Service.shared?.isPremium == true {
      removeBanner(from: bannerView)
    }
    else {
      loadBanner(in: bannerView)
    }
    bannerView?.superview?.setNeedsUpdateConstraints()
    bannerView?.superview?.setNeedsLayout()
    bannerView?.superview?.layoutIfNeeded()
  }

  func loadBanner(in bannerView: BannerView?) {
    if SubsCore.Subs.Service.shared?.isPremium == true { return }

//    Ads.Service.shared?.getBanner(vc: self, loadedBlock: { [weak self] banner in
//      self?.bannerView.setBanner(banner: banner)
//    }, errorBlock: { [weak self] in
//      DispatchQueue.main.async {
//        self?.removeBanner()
//      }
//      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//        self?.loadBanner()
//      }
//    })
  }

  func removeBanner(from bannerView: BannerView?) {
    bannerView?.removeBanner()
  }

}
