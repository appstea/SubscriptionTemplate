//
//  UILabel~DynamicFont.swift
//
//  Created by dDomovoj on 6/16/22.
//

import UIKit

public struct DynamicFont {

  public static func ultraLight(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .ultraLight)) }
  public static func thin(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .thin)) }
  public static func light(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .light)) }
  public static func regular(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .regular)) }
  public static func medium(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .medium)) }
  public static func semibold(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .semibold)) }
  public static func bold(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .bold)) }
  public static func heavy(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .heavy)) }
  public static func black(of size: CGFloat) -> DynamicFont { .init(internal: .systemFont(ofSize: size, weight: .black)) }

  public static func italic(of size: CGFloat) -> DynamicFont { .init(internal: .italicSystemFont(ofSize: size)) }

  @available(iOS 13.0, *)
  public enum Monospaced {
    public static func ultraLight(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .ultraLight)) }
    public static func thin(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .thin)) }
    public static func light(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .light)) }
    public static func regular(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .regular)) }
    public static func medium(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .medium)) }
    public static func semibold(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .semibold)) }
    public static func bold(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .bold)) }
    public static func heavy(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .heavy)) }
    public static func black(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedSystemFont(ofSize: size, weight: .black)) }
  }

  public enum MonospacedDigits {
    public static func ultraLight(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .ultraLight)) }
    public static func thin(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .thin)) }
    public static func light(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .light)) }
    public static func regular(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .regular)) }
    public static func medium(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .medium)) }
    public static func semibold(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .semibold)) }
    public static func bold(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .bold)) }
    public static func heavy(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .heavy)) }
    public static func black(of size: CGFloat) -> DynamicFont { .init(internal: .monospacedDigitSystemFont(ofSize: size, weight: .black)) }
  }

  fileprivate var `internal`: UIFont
  fileprivate var maxSize: CGFloat = .greatestFiniteMagnitude
  fileprivate var textStyle: UIFont.TextStyle = .body

  public func maxSize(to size: CGFloat) -> DynamicFont {
    var copy = self
    copy.maxSize = size
    return copy
  }

  public func textStyle(_ textStyle: UIFont.TextStyle) -> DynamicFont {
    var copy = self
    copy.textStyle = textStyle
    return copy
  }

  public func asFont() -> UIFont {
    UIFontMetrics(forTextStyle: textStyle).scaledFont(for: `internal`, maximumPointSize: maxSize)
  }

}

public extension UILabel {

  var dynamicFont: DynamicFont {
    get { preconditionFailure("Only setter should be used") }
    set {
      adjustsFontForContentSizeCategory = true
      font = newValue.asFont()
    }
  }

  func setDynamicFont(font: UIFont, maximumPointSize: CGFloat? = nil) {
    adjustsFontForContentSizeCategory = true
    self.font = UIFontMetrics(forTextStyle: .body)
      .scaledFont(for: font, maximumPointSize: maximumPointSize ?? .greatestFiniteMagnitude)
  }

  func isTruncated(size: CGFloat) -> (Bool, CGFloat) {
    guard text != nil else {
      return (false, 0)
    }

    let label = UILabel()
    label.setDynamicFont(font: .systemFont(ofSize: size))
    label.text = self.text
    label.sizeToFit()

    return (label.frame.size.width > bounds.size.width, bounds.size.width / label.frame.size.width)
  }

}
