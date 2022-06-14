//
//  Root~VC.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import UIKit

public enum Root { }

public extension Root {

  final class ViewController: Base.ViewController {

    private lazy var permissionsVC = Permissions.ViewController()

    public override func viewDidLoad() {
      super.viewDidLoad()
      if UserStore.didPassPrepermission {
        addChild(permissionsVC)
      }
    }

  }
}
