//
//  MainScreen~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

import PinLayout

import UIBase
import SubsCraftCore

public enum MainScreen { }

public extension MainScreen {

  final class ViewController: UIBase.ViewController {

    private lazy var bannerView = Subs.core.banner(source: .bottomUpsell, intent: .normal, presenter: self)

    // MARK: - Lifecycle

    public override func loadView() {
      super.loadView()
      view.backgroundColor = Color.Main.back.color
      view.addSubviews(bannerView)
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
      if !Subs.core.isPremium {
        bannerView.pin.start().end()
          .bottom(safeArea.bottom)
          .sizeToFit(.width)
      }
    }

  }
}
