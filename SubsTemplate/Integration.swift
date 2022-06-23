//
//  Integration.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/23/22.
//

import Foundation

import SubsCore
import SubsUI

enum Subs {

  static let core = Instance(
    config: .init(
      subs: .init(
        apiKey: "appl_PrQxhLfrujRwauAlGngBUArKhIK",
        offering: "com.appstea.proto.first",
        isDebug: isDebug,
        urls: .init(
          policy: "https://appstea.com/legal/privacy-policy/",
          terms: "https://appstea.com/legal/terms-of-use/"
//          store: "https://apps.apple.com/us/app/id1533228338"
        )
      ),
      analytics: .init(
        isOSLogEnabled: isDebug || isAdHoc,
        isFirebaseEnabled: true,
        isBranchEnabled: true
      ),
      ui: .init(
        permissions: .custom(),
        subscription: .custom(),
        banner: .custom()
      )
    )
  )

}

// MARK: - Banner.Custom

fileprivate extension Config.UI.Banner {

  static func custom() -> Self? {
    nil
//    var `default` = Config.UI.Banner.Default()
//    `default`.title = "TexT"
//    return Self(default: `default`)
  }

}

// MARK: - Permissions.Custom

fileprivate extension Config.UI.Permissions {

  static func custom() -> Self? {
    nil
//    var result = Self()
//    result.dotColor = .red
//    return result
  }

}

// MARK: - Subscription.Custom

fileprivate extension Config.UI.Subscription {

  static func custom() -> Self? {
    nil
//    var result = Self()
//    result.textColor = .red
//    return result
  }

}
