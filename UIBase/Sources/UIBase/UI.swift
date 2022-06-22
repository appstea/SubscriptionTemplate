//
//  Created by dDomovoj on 10/24/17.
//

import UIKit
import Foundation

// MARK: - UI

public enum UI {

  public struct Intent: Hashable {
    public static let regular = Intent()

    let id: UUID

    public init() {
      id = .init()
    }
  }

  public typealias Widths = [UIUserInterfaceIdiom: CGFloat]
  private typealias IntentWidths = [Intent: Widths]

  private static var intentBaseWidths = IntentWidths()
  private static var intentScaleFactor = [Intent: CGFloat]()

  public static func baseWidths(for intent: Intent = .regular) -> Widths {
    intentBaseWidths[intent] ?? [:]
  }

  public static func setBaseWidths(_ widths: Widths, for intent: Intent = .regular) {
    intentBaseWidths[intent] = widths
    intentScaleFactor[intent] = calculateScale(for: intent)
  }

  public static func scaleFactor(for intent: Intent = .regular) -> CGFloat {
    if let scale = intentScaleFactor[intent] {
      return scale
    }

    let scale = calculateScale(for: intent)
    intentScaleFactor[intent] = scale
    return scale
  }

}

// MARK: - Private.UI

private extension UI {

  static func calculateScale(for intent: Intent) -> CGFloat {
    let size = UIScreen.main.bounds.size
    let width = min(size.width, size.height)
    let idiom = UIDevice.current.userInterfaceIdiom
    let result: CGFloat
    let baseWidth: CGFloat
    let intentWidths = intentBaseWidths[intent] ?? [:]
    switch idiom {
    case .pad: baseWidth = intentWidths[idiom] ?? 768.0
    case .phone: baseWidth = intentWidths[idiom] ?? 375.0
    default: baseWidth = width
    }
    result = width / baseWidth
    return result
  }

}
