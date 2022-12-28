//
//  FreeViewController.swift
//  SubsTemplate
//
//  Created by dDomovoj on 12/27/22.
//

import UIKit

import PinLayout

import UIBase
import PaywallCraftCore

final class FreeViewController: UIBase.ViewController {
  
  private let label = UILabel {
    $0.text = "Free app experience, add your interface here."
    $0.numberOfLines = 0
    $0.textAlignment = .center
  }
  
  private lazy var bannerView = PaywallCore.upsell(from: self)
  
  // MARK: - Lifecycle
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = Color.Main.back.color
    view.addSubview(label)
    view.addSubview(bannerView)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let safeArea = view.pin.safeArea
    
    label.pin.hCenter().top(20%).maxWidth(75%).sizeToFit(.width)
    bannerView.pin.start().end()
      .bottom(safeArea.bottom)
      .sizeToFit(.width) 
  }
  
}
