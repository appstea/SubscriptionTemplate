//
//  File.swift
//
//  Created by dDomovoj on 6/22/22.
//

import Foundation

import UIBase

extension UI.Intent {
  static let subs = _UIToken().intent
}

private final class _UIToken {

  let intent = UI.Intent()

  init() {
    UI.setBaseWidths([.phone: 375, .pad: 768], for: intent)
  }

}
