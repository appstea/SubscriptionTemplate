//
//  MainScreen~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

import UIBase
import PaywallCraftCore
import AnalyticsCraft

final class SimpleViewController: UIBase.ViewController {
  
  private let containerView = UIBase.View()
  private var contentVC: UIViewController?
  
  // MARK: - Lifecycle
  
  public override func loadView() {
    super.loadView()
    view.addSubview(containerView)
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    PaywallCore.onEvents.add { [weak self] e in
      if case .status = e {
        self?.didChangePaywallStatus()
      }
    }.bindLifetime(to: self)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    updateContentIfNeeded(animated: animated)
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
    
    containerView.pin.all()
    contentVC?.view.pin.all()
  }
  
  // MARK: - Private
  
  private func didChangePaywallStatus() {
    updateContentIfNeeded()
    view.setNeedsLayout()
  }
  
  private func updateContentIfNeeded(animated: Bool = false) {
    let isPremium = PaywallCore.isPremium
    
    if isPremium && contentVC is PaidViewController { return }
    if !isPremium && contentVC is FreeViewController { return }
    
    if let child = contentVC {
      child.willMove(toParent: nil)
      child.view.removeFromSuperview()
      child.beginAppearanceTransition(false, animated: animated)
      child.removeFromParent()
      if !animated {
        child.endAppearanceTransition()
      }
    }
    
    let child = PaywallCore.isPremium ? PaidViewController() : FreeViewController()
    contentVC = child
    
    child.view.translatesAutoresizingMaskIntoConstraints = true
    addChild(child)
    child.beginAppearanceTransition(true, animated: animated)
    containerView.addSubview(child.view)
    child.didMove(toParent: self)
    if !animated {
      child.endAppearanceTransition()
    }
    
    view.setNeedsLayout()
  }
  
}
