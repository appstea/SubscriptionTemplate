//
//  Created by Dmitry Duleba on 11/13/18.
//

import UIKit
import Foundation

// MARK: - UIScalable

protocol UIScalable {

  associatedtype UIValue

  var ui: UIValue { get }
  
}

extension Int: UIScalable {

  typealias UIValue = CGFloat
  var ui: UIValue { UI.value(self) }

}

extension UInt: UIScalable {

  typealias UIValue = CGFloat
  var ui: UIValue { UI.value(self) }

}

extension CGFloat: UIScalable {

  typealias UIValue = CGFloat
  var ui: UIValue { UI.value(self) }

}

extension Double: UIScalable {

  typealias UIValue = CGFloat
  var ui: UIValue { UI.value(CGFloat(self)) }

}

extension Float: UIScalable {

  typealias UIValue = CGFloat
  var ui: UIValue { UI.value(CGFloat(self)) }

}

extension CGPoint: UIScalable {

  typealias UIValue = CGPoint
  var ui: UIValue { UI.value(self) }

}

extension CGSize: UIScalable {

  typealias UIValue = CGSize
  var ui: UIValue { UI.value(self) }

}

extension UIOffset: UIScalable {

  typealias UIValue = UIOffset
  var ui: UIValue { UI.value(self) }

}

extension UIEdgeInsets: UIScalable {

  typealias UIValue = UIEdgeInsets
  var ui: UIValue { UI.value(self) }

}

extension UIFont: UIScalable {

  typealias UIValue = UIFont
  var ui: UIValue { UI.value(self) }

}

extension Array where Element: UIScalable {

  var ui: [Element.UIValue] { map { $0.ui } }

}

// MARK: - UI.Private

fileprivate extension UI {

  static func value(_ value: CGFloat) -> CGFloat {
    let absValue = abs(value)
    let sign = value.sign
    guard absValue > 1.0 else { return value }
    return floor(absValue * scaleFactor()) * (sign == .minus ? -1 : 1)
  }

  static func value(_ value: Int) -> CGFloat {
    UI.value(CGFloat(value))
  }

  static func value(_ value: UInt) -> CGFloat {
    UI.value(CGFloat(value))
  }

  static func value(_ value: CGSize) -> CGSize {
    let scaleFactor = self.scaleFactor()
    return CGSize(width: ceil(value.width * scaleFactor),
                  height: ceil(value.height * scaleFactor))
  }

  static func value(_ value: CGPoint) -> CGPoint {
    let scaleFactor = self.scaleFactor()
    return CGPoint(x: ceil(value.x * scaleFactor),
                   y: ceil(value.y * scaleFactor))
  }

  static func value(_ value: UIEdgeInsets) -> UIEdgeInsets {
    let scaleFactor = self.scaleFactor()
    return UIEdgeInsets(top: value.top * scaleFactor,
                        left: value.left * scaleFactor,
                        bottom: value.bottom * scaleFactor,
                        right: value.right * scaleFactor)
  }

  static func value(_ value: UIOffset) -> UIOffset {
    let scaleFactor = self.scaleFactor()
    let offset = UIOffset(horizontal: value.horizontal * scaleFactor,
                          vertical: value.vertical * scaleFactor)
    return offset
  }

  static func value(_ value: UIFont) -> UIFont {
    let fontSize = UI.value(value.pointSize)
    return value.withSize(fontSize)
  }

}
