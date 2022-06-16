//
//  Created by dDomovoj on 10/24/17.
//

import UIKit
import Foundation

// MARK: - UI

enum UI {

  typealias Widths = [UIUserInterfaceIdiom: CGFloat]

  private static var _baseWidths = Widths()
  private static var _scaleFactor: CGFloat?

  static func setBaseWidths(_ widths: Widths) {
    _baseWidths = widths
    _scaleFactor = calculateScale()
  }

  static func scaleFactor() -> CGFloat {
    if let scale = _scaleFactor {
      return scale
    }

    let scale = calculateScale()
    _scaleFactor = scale
    return scale
  }

}

// MARK: - Private.UI

private extension UI {

  static func calculateScale() -> CGFloat {
    let size = UIScreen.main.bounds.size
    let width = min(size.width, size.height)
    let idiom = UIDevice.current.userInterfaceIdiom
    let result: CGFloat
    let baseWidth: CGFloat
    let widths = _baseWidths
    switch idiom {
    case .pad: baseWidth = widths[idiom] ?? 1536.0
    case .phone: baseWidth = widths[idiom] ?? 640.0
    default: baseWidth = width
    }
    result = width / baseWidth
    return result
  }

}
