//
//  MainScreen~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/8/22.
//

import UIKit

public enum MainScreen { }

public extension MainScreen {

  final class ViewController: Base.ViewController {

    private let bannerView = BannerView()

    // MARK: - Lifecycle

    override public func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .lightGray
      // Do any additional setup after loading the view.

      //    upgradeView.onClick = { [weak self] in
      //        self?.component.services.subs?.showSubscription(source: .bottomUpsell, intent: .normal, from: self)
      //    }
    }


  }

}
