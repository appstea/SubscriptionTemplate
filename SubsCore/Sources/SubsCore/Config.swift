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
    let permissionsImage: UIImage?
    let subscriptionImage: UIImage?
    let defaultBannerIcon: UIImage?

    public init(
      permissionsImage: UIImage? = nil,
      subscriptionImage: UIImage? = nil,
      defaultBannerIcon: UIImage? = nil
    ) {
      self.permissionsImage = permissionsImage
      self.subscriptionImage = subscriptionImage
      self.defaultBannerIcon = defaultBannerIcon
    }
  }

}
