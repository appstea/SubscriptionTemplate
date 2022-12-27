//
//  Complex~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 12/27/22.
//

import UIKit

import PinLayout

import UIBase
import PaywallCraftCore
import AnalyticsCraft

public enum ComplexScreen { }

extension ComplexScreen {
  
  struct CustomSource: IPaywallSource {
    var analytics: IAnalyticsValue { "Main Screen".analytics() }
  }
}

public extension ComplexScreen {

  final class ViewController: UIBase.ViewController {

    private lazy var bannerView = PaywallCore.upsell(
      source: Paywall.Source.bottomUpsell,
      screen: Paywall.Screen.initial,
      from: self,
      onEvents: { [weak self] in print($0) }
    )
    
    private let ctaButton = UIBase.Button {
      $0.setTitle("Show Paywall", for: .normal)
      $0.setTitleColor(Color.Main.text.color, for: .normal)
    }

    // MARK: - Lifecycle

    public override func loadView() {
      super.loadView()
      view.backgroundColor = Color.Main.back.color
      view.addSubviews(bannerView, ctaButton)
    }
    
    public override func viewDidLoad() {
      super.viewDidLoad()
      PaywallCore.onEvents.add { [weak self] e in
        guard case .status = e else { return }
        
        let isPremium = PaywallCore.isPremium
        self?.bannerView.isHidden = isPremium
        self?.ctaButton.isHidden = isPremium
        self?.view.setNeedsLayout()
      }.bindLifetime(to: self)
      
      ctaButton.addAction { _ in
        PaywallCore.showPaywall(source: CustomSource(),
                                screen: Paywall.Screen.initial)
      }
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
      if !PaywallCore.isPremium {
        bannerView.pin.start().end()
          .bottom(safeArea.bottom)
          .sizeToFit(.width)
        
        ctaButton.pin.sizeToFit()
          .vCenter(safeArea.top - safeArea.bottom)
          .hCenter(safeArea.left - safeArea.right)
      }
    }

  }
}

