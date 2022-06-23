//
//  _HUD.swift
//
//  Created by dDomovoj on 6/15/22.
//

import UIKit
//import SVProgressHUD

enum HUD {

  static func show() {
    DispatchQueue.main.async {
      //            SVProgressHUD.setDefaultMaskType(.custom)
      //            SVProgressHUD.setBackgroundLayerColor(UIColor.black.withAlphaComponent(0.3))
      //            SVProgressHUD.show()
    }
  }

  static func dismiss() {
    DispatchQueue.main.async {
      //            SVProgressHUD.dismiss()
    }
  }

}

