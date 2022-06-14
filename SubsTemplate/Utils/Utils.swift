//
//  Utils.swift
//
//  Created by dDomovoj on 9/30/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation
import UIKit

var isPortrait: Bool {
  if #available(iOS 13.0, *) {
    return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.interfaceOrientation.isPortrait ?? false
  }
  else {
    return UIApplication.shared.statusBarOrientation.isPortrait
  }
}

var isLandscape: Bool {
  if #available(iOS 13.0, *) {
    return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.interfaceOrientation.isLandscape ?? false
  }
  else {
    return UIApplication.shared.statusBarOrientation.isLandscape
  }
}

let isPad = UIDevice.current.userInterfaceIdiom == .pad
#if DEBUG
let isDebug = true
#else
let isDebug = false
#endif

#if ADHOC
let isAdHoc = true
#else
let isAdHoc = false
#endif

#if RELEASE
let isRelease = true
#else
let isRelease = false
#endif

enum Const {

  enum Bundle {
    static var current: String { Foundation.Bundle.main.bundleIdentifier ?? preconditionFailure("Must be present") }
  }

}
