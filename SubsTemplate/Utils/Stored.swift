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

// MARK: - UserStore

final class UserStore {

  private let defaults = UserDefaults.standard

  fileprivate func getValue<T: IStored>(for key: String) -> T? { T.getValue(for: key, using: defaults) }
  fileprivate func setValue<T: IStored>(_ value: T, for key: String) { T.setValue(value, for: key, using: defaults) }

}

// MARK: - Stored

@propertyWrapper
struct Stored<Value: IStored> {

  private let key: String
  private let defaultValue: Value

  var wrappedValue: Value {
    get { UserStore().getValue(for: key) ?? defaultValue }
    set { UserStore().setValue(newValue, for: key) }
  }

  init(_ key: String, defaultValue: Value) {
    self.key = key
    self.defaultValue = defaultValue
  }

}
