//
//  Integration.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/23/22.
//

import PaywallCraftCore

enum Paywall {

  static let core = PaywallCraftCore.Instance(
    config: .init(
      paywall: .init(
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
        paywall: .custom(),
        upsell: .custom()
      )
    )
  )

}

// MARK: - Upsell.Custom

fileprivate extension Config.UI.Upsell {

  static func custom() -> Self? {
    nil
//    Self()
//      .default {
//        $0.updgradeCTA { $0.cornerRadius(8) }
//          .background { $0.backgroundColor(.yellow) }
//      }
//      .background {
//        $0.backgroundColor(.red)
//      }
  }

}

// MARK: - Permissions.Custom

fileprivate extension Config.UI.Permissions {

  static func custom() -> Self? {
//    var result = Self()
//    result.permissions = result.permissions.filter {
//      $0.type.isAny(of: .photos)
//    }
//    return result
    nil
  }

}

// MARK: - Paywall.Custom

fileprivate extension Config.UI.Paywall {

  static func custom() -> Self? {
    nil
//    var result = Self()
//    result.textColor = .red
//    return result
  }

}
