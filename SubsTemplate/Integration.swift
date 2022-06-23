//
//  Integration.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/23/22.
//

import Foundation
import SubsCore

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
      )
    )
  )

}
