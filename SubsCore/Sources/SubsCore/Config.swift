//
//  Config.swift
//
//  Created by dDomovoj on 6/23/22.
//

import Foundation
import UIKit

public struct Config {

  let subs: Subs
  let analytics: Analytics
  let ui: UI

  public init(subs: Subs, analytics: Analytics? = nil, ui: UI? = nil) {
    self.subs = subs
    self.analytics = analytics ?? Analytics()
    self.ui = ui ?? UI()
  }

}

// MARK: - UI

public extension Config {

  struct UI {
    let permissions: Permissions?
    let subscription: Subscription?
    let banner: Banner?

    public init(
      permissions: Permissions? = nil,
      subscription: Subscription? = nil,
      banner: Banner? = nil
    ) {
      self.permissions = permissions
      self.subscription = subscription
      self.banner = banner
    }
  }

}
