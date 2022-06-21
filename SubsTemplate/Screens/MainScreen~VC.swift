//
//  MainScreen~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

import UIBase
import UISubs

public enum MainScreen { }

public extension MainScreen {

  final class ViewController: UIBase.ViewController {

    private let bannerView = BannerView()

    // MARK: - Lifecycle

    public override func loadView() {
      super.loadView()
      view.backgroundColor = Color.Main.back.color
      view.addSubviews(bannerView)
    }

    public override func viewDidLoad() {
      super.viewDidLoad()
      bannerView.onClick = { [weak self] in
        Subs.Service.shared?.showSubscription(source: .bottomUpsell, intent: .normal, from: self)
      }

      addObservers()
      updateBannerIfNeeded()
    }

    public override func viewWillTransition(to size: CGSize,
                                            with coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransition(to: size, with: coordinator)
      coordinator.animate(alongsideTransition: { _ in
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
      }, completion: nil)
    }

    public override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      let safeArea = view.pin.safeArea
      let isPremium = Subs.Service.shared?.isPremium == true
      if !isPremium {
        bannerView.pin.start().end()
          .bottom(safeArea.bottom)
          .sizeToFit(.width)
      }
    }

  }
}

// MARK: - Private

private extension MainScreen.ViewController {

  func addObservers() {
    Notification.Subs.Update.observe { [weak self] in self?.updateBannerIfNeeded() }.bind(to: self)
    Notification.System.DidBecomeActive.observe { [weak self] in self?.loadBanner() }.bind(to: self)
    Notification.System.DidEnterBackground.observe { [weak self] in self?.removeBanner() }.bind(to: self)
    Notification.System.WillResignActive.observe { [weak self] in self?.removeBanner() }.bind(to: self)
  }

  // MARK: - Banner

  func updateBannerIfNeeded() {
    if Subs.Service.shared?.isPremium == true {
      removeBanner()
    }
    else {
      loadBanner()
    }
    view.setNeedsUpdateConstraints()
    view.layoutIfNeeded()
  }

  func loadBanner() {
    if Subs.Service.shared?.isPremium == true { return }

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

  func removeBanner() {
    bannerView.removeBanner()
  }

}
