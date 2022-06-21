//
//  Stored.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import Foundation

public protocol IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self?
  static func setValue(_ value: Self, for key: String, using defaults: UserDefaults)

}

public extension IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? {
    defaults.object(forKey: key) as? Self
  }
  static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) {
    defaults.set(value, forKey: key)
  }

}

extension NSData: IStored {}
extension NSString: IStored {}
extension NSNumber: IStored {}
extension NSDate: IStored {}
extension NSArray: IStored {}
extension NSDictionary: IStored {}

extension Date: IStored {}

extension Int: IStored {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.integer(forKey: key) }
  public static func setValue(_ value: Int, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension Bool: IStored {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.bool(forKey: key) }
  public static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension Float: IStored {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.float(forKey: key) }
  public static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension Double: IStored {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.double(forKey: key) }
  public static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension URL: IStored {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.url(forKey: key) }
  public static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension String: IStored {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.string(forKey: key) }

}

extension IStored where Self == Array<String> {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.stringArray(forKey: key) }

}

extension Array: IStored {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.array(forKey: key) as? Self }

}

extension Dictionary: IStored {

  public static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.dictionary(forKey: key) as? Self }

}

// MARK: - Stored

public final class Stored { }

@propertyWrapper
public struct StorageKey<Value: IStored> {

  private let key: String
  private let defaultValue: () -> Value
  private let storage: UserDefaults

  public var wrappedValue: Value {
    get { Value.getValue(for: key, using: storage) ?? defaultValue() }
    set { Value.setValue(newValue, for: key, using: storage) }
  }

  public init(_ key: String, defaultValue: @autoclosure @escaping () -> Value, storage: UserDefaults? = nil) {
    self.key = key
    self.defaultValue = defaultValue
    self.storage = storage ?? .standard
  }

}
