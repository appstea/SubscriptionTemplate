// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen


#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias AssetImageTypeAlias = UIImage
#endif

internal typealias Asset = UISubsAssets.Images
internal typealias Color = UISubsAssets.Colors

internal extension Bundle {
    @objc
    static var assets: Bundle { .module }
}

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum UISubsAssets {
  internal enum Colors {

    internal enum Banner {
      internal static let background = ColorAsset(name: "Colors/Banner/background")
      internal static let cta = ColorAsset(name: "Colors/Banner/cta")
    }
    internal enum DotLabel {
      internal static let dot = ColorAsset(name: "Colors/DotLabel/dot")
    }
    internal enum Main {
      internal static let back = ColorAsset(name: "Colors/Main/back")
      internal static let text = ColorAsset(name: "Colors/Main/text")
    }
    internal enum Onboarding {
      internal static let background = ColorAsset(name: "Colors/Onboarding/background")
      internal static let `continue` = ColorAsset(name: "Colors/Onboarding/continue")
    }
    internal enum Subs {
      internal static let background = ColorAsset(name: "Colors/Subs/background")
      internal static let `continue` = ColorAsset(name: "Colors/Subs/continue")
      internal static let dopButton = ColorAsset(name: "Colors/Subs/dopButton")
      internal static let infoCloseButton = ColorAsset(name: "Colors/Subs/infoCloseButton")
      internal static let infoLabel = ColorAsset(name: "Colors/Subs/infoLabel")
      internal static let infoTitle = ColorAsset(name: "Colors/Subs/infoTitle")
      internal static let price = ColorAsset(name: "Colors/Subs/price")
      internal static let title = ColorAsset(name: "Colors/Subs/title")
    }
  }
  internal enum Images {

    internal enum Banner {
      internal static let `default` = ImageAsset(name: "Images/Banner/default")
      internal static let icon = ImageAsset(name: "Images/Banner/icon")
    }
    internal enum Permissions {
      internal static let image = ImageAsset(name: "Images/Permissions/image")
    }
    internal enum Subs {
      internal static let close = ImageAsset(name: "Images/Subs/close")
      internal static let cross = ImageAsset(name: "Images/Subs/cross")
      internal static let image = ImageAsset(name: "Images/Subs/image")
      internal static let star = ImageAsset(name: "Images/Subs/star")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct DataAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(OSX)
  @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
  internal var data: NSDataAsset {
    return NSDataAsset(asset: self)
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(OSX)
@available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
internal extension NSDataAsset {
  convenience init!(asset: DataAsset) {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(OSX)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}
#endif

internal struct ImageAsset: Hashable {
  internal fileprivate(set) var name: String

  internal var image: AssetImageTypeAlias {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS)
    let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = AssetImageTypeAlias(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal extension AssetImageTypeAlias {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle.module
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
