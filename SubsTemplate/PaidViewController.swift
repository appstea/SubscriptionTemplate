//
//  PaidViewController.swift
//  SubsTemplate
//
//  Created by dDomovoj on 12/27/22.
//

import UIKit

import PinLayout

import UIBase

final class PaidViewController: UIBase.ViewController {
  
  private let label = UILabel {
    $0.text = "Premium app experience, add your interface here."
    $0.numberOfLines = 0
    $0.textAlignment = .center
  }
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = Color.Main.back.color
    view.addSubview(label)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    label.pin.hCenter().top(20%).maxWidth(75%).sizeToFit(.width)
  }
  
}
