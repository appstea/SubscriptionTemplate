// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen


#if os(OSX)
  import AppKit.NSImage
  public typealias AssetColorTypeAlias = NSColor
  public typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  public typealias AssetColorTypeAlias = UIColor
  public typealias AssetImageTypeAlias = UIImage
#endif

public typealias Asset = Assets.Images
public typealias Color = Assets.Colors

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Assets {
  public enum Colors {

    public enum Banner {
      public static let background = ColorAsset(name: "Colors/Banner/background")
      public static let cta = ColorAsset(name: "Colors/Banner/cta")
    }
    public enum DotLabel {
      public static let dot = ColorAsset(name: "Colors/DotLabel/dot")
    }
    public enum Main {
      public static let back = ColorAsset(name: "Colors/Main/back")
      public static let text = ColorAsset(name: "Colors/Main/text")
    }
    public enum Onboarding {
      public static let background = ColorAsset(name: "Colors/Onboarding/background")
      public static let `continue` = ColorAsset(name: "Colors/Onboarding/continue")
    }
    public enum Subs {
      public static let background = ColorAsset(name: "Colors/Subs/background")
      public static let `continue` = ColorAsset(name: "Colors/Subs/continue")
      public static let dopButton = ColorAsset(name: "Colors/Subs/dopButton")
      public static let infoCloseButton = ColorAsset(name: "Colors/Subs/infoCloseButton")
      public static let infoLabel = ColorAsset(name: "Colors/Subs/infoLabel")
      public static let infoTitle = ColorAsset(name: "Colors/Subs/infoTitle")
      public static let price = ColorAsset(name: "Colors/Subs/price")
      public static let title = ColorAsset(name: "Colors/Subs/title")
    }
  }
  public enum Images {

    public enum Banner {
      public static let `default` = ImageAsset(name: "Images/Banner/default")
      public static let icon = ImageAsset(name: "Images/Banner/icon")
    }
    public enum Permissions {
      public static let image = ImageAsset(name: "Images/Permissions/image")
    }
    public enum Subs {
      public static let close = ImageAsset(name: "Images/Subs/close")
      public static let cross = ImageAsset(name: "Images/Subs/cross")
      public static let image = ImageAsset(name: "Images/Subs/image")
      public static let star = ImageAsset(name: "Images/Subs/star")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ColorAsset {
  public fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  public var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

public extension AssetColorTypeAlias {
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

public struct DataAsset {
  public fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(OSX)
  @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
  public var data: NSDataAsset {
    return NSDataAsset(asset: self)
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(OSX)
@available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
public extension NSDataAsset {
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

public struct ImageAsset: Hashable {
  public fileprivate(set) var name: String

  public var image: AssetImageTypeAlias {
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

public extension AssetImageTypeAlias {
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
