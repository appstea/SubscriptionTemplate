//
//  Integration.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/23/22.
//

import PaywallCraftCore
import PaywallCraftUI

import UIKit

var PaywallCore: PaywallCraftCore.Instance { _Paywall.core }

private enum _Paywall {

  static let core = PaywallCraftCore.Instance(config: config)
  
  static let config = PaywallCraftCore.Config(
    paywall: .init(
      apiKey: "appl_xZmrbLEUvGKtGaFaNMQyahGWXrL",
      offering: "com.wm.subs.one",
      isDebug: isDebug,
      urls: .init(
        policy: "https://appstea.com/legal/privacy-policy/",
        terms: "https://appstea.com/legal/terms-of-use/"
//          store: "https://apps.apple.com/us/app/id1533228338"
      )
    ),
    att: .init(fullScreen: false),
    analytics: .init(
      isOSLogEnabled: isDebug || isAdHoc,
      isFirebaseEnabled: true,
      isBranchEnabled: false
    ),
    ui: .init(
      permissions: .custom(),
      paywall: .custom(),
      upsell: .custom()
    )
  )

}

// MARK: - Upsell.Custom

fileprivate extension Config.UI.Upsell {

  static func custom() -> Self? {
    nil
//    Self()
//      .default { defaultUpsell in
//        defaultUpsell
//          .background { defaultUpsellBackground in
//            defaultUpsellBackground
//              .cornerRadius(0)
//              .backgroundColor(.blue)
//          }
//          .icon { defaultUpsellIcon in
//            defaultUpsellIcon
//              .size(.value(CGSize(width: 32, height: 32)))
//              .view { defaultUpsellIconView in
//                defaultUpsellIconView
//                  .backgroundColor(.clear)
//                  .cornerRadius(16)
//              }
//          }
//          .title { defaultUpsellTitle in
//            defaultUpsellTitle.text(
//              PaywallCraftUI.VM.Text("Ads free and premimu features")
//                .font(.boldSystemFont(ofSize: 16))
//                .textColor(.green)
//            )
//            .adjustsFontSize(.minScale(0.8))
//            .numberOfLines(2)
//          }
//          .cta { cta in
//            cta
//              .height(30)
//              .text { ctaText in
//                ctaText
//                  .string("Custom Text")
//                  .textColor(.red)
//                  .font(.systemFont(ofSize: 20))
//              }
//              .textPadding(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 16))
//              .background { ctaBackground in
//                ctaBackground
//                  .backgroundColor(.blue)
//                  .cornerRadius(12)
//              }
//          }
//          .contentPadding(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
//          .titlePadding(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
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
