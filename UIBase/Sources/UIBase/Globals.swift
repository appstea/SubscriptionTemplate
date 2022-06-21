//
//  Globals.swift
//
//  Created by dDomovoj on 6/21/22.
//

import UIKit

public let isRTL = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
public let isPad = UIDevice.current.userInterfaceIdiom == .pad
public let isPhone = UIDevice.current.userInterfaceIdiom == .phone

public var isPortrait: Bool {
  if #available(iOS 13.0, *) {
    return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.interfaceOrientation.isPortrait ?? false
  }
  else {
    return UIApplication.shared.statusBarOrientation.isPortrait
  }
}

public var isLandscape: Bool {
  if #available(iOS 13.0, *) {
    return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.interfaceOrientation.isLandscape ?? false
  }
  else {
    return UIApplication.shared.statusBarOrientation.isLandscape
  }
}
