//
//  MainScreen~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

import PinLayout

import UIBase
import PaywallCraftCore
import AnalyticsCraft

final class MainViewController: UIBase.ViewController {
  
  private lazy var bannerView = PaywallCore.upsell(from: self)
  
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
      if case .status = e {
        self?.didChangePawywallStatus()
      }
    }.bindLifetime(to: self)
    
    ctaButton.addAction { _ in
      PaywallCore.showPaywall()
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
  
  // MARK: - Private
  
  private func didChangePawywallStatus() {
    let isPremium = PaywallCore.isPremium
    bannerView.isHidden = isPremium
    ctaButton.isHidden = isPremium
    view.setNeedsLayout()
  }
  
}
