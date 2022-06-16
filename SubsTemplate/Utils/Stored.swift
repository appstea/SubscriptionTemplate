//
//  Stored.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/9/22.
//

import Foundation

protocol IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self?
  static func setValue(_ value: Self, for key: String, using defaults: UserDefaults)

}

extension IStored {

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

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.integer(forKey: key) }
  static func setValue(_ value: Int, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension Bool: IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.bool(forKey: key) }
  static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension Float: IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.float(forKey: key) }
  static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension Double: IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.double(forKey: key) }
  static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension URL: IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.url(forKey: key) }
  static func setValue(_ value: Self, for key: String, using defaults: UserDefaults) { defaults.set(value, forKey: key) }

}

extension String: IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.string(forKey: key) }

}

extension IStored where Self == Array<String> {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.stringArray(forKey: key) }

}

extension Array: IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.array(forKey: key) as? Self }

}

extension Dictionary: IStored {

  static func getValue(for key: String, using defaults: UserDefaults) -> Self? { defaults.dictionary(forKey: key) as? Self }

}

// MARK: - Stored

final class Stored { }

@propertyWrapper
struct StorageKey<Value: IStored> {

  private let key: String
  private let defaultValue: () -> Value
  private let storage: UserDefaults

  var wrappedValue: Value {
    get { Value.getValue(for: key, using: storage) ?? defaultValue() }
    set { Value.setValue(newValue, for: key, using: storage) }
  }

  init(_ key: String, defaultValue: @autoclosure @escaping () -> Value, storage: UserDefaults? = nil) {
    self.key = key
    self.defaultValue = defaultValue
    self.storage = storage ?? .standard
  }

}
