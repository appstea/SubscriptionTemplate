//
//  Notifications.swift
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation

import CallbacksCraft

public enum NotificationName {
  case string(String)
  case notification(Foundation.Notification.Name)
}
public protocol INotification {

  associatedtype Data

  static var name: NotificationName { get }

}

public final class RegisteredNotification {

  let token: NSObjectProtocol
  fileprivate let center: NotificationCenter
  fileprivate let name: Foundation.Notification.Name
  fileprivate var unmanaged: Unmanaged<RegisteredNotification>?
  fileprivate var isBinded = false

  // MARK: - Init

  fileprivate init(token: NSObjectProtocol, center: NotificationCenter, name: NSNotification.Name) {
    self.token = token
    self.center = center
    self.name = name
  }

  deinit {
    center.removeObserver(token, name: name, object: nil)
  }

  // MARK: - Public

  public func bind(to object: NSObject) {
    if unmanaged != nil { return }

    unmanaged = .passRetained(self)
    object.onDeinit.once { [weak self] in
      guard let self = self else { return }

      self.unmanaged?.release()
      self.unmanaged = nil
    }
  }

}

// MARK: - Public

public extension INotification {

  private static var center: NotificationCenter { .default }
  private static var _name: Foundation.Notification.Name {
    switch name {
    case .notification(let name): return name
    case .string(let name): return .init(name)
    }
  }

  static var name: NotificationName { .string("notification.\(self)") }

  static func post(_ data: Data) {
    center.post(name: _name, object: nil, userInfo: ["data": data])
  }

  static func observe(on queue: OperationQueue? = nil,
                      block: @escaping (Data) -> Void) -> RegisteredNotification {
    let queue = queue ?? .current
    let token = center.addObserver(forName: _name, object: nil, queue: queue) { notification in
      guard let data = notification.userInfo?["data"] as? Data else { return }

      block(data)
    }
    let result = RegisteredNotification(token: token, center: center, name: _name)
    return result
  }

}

public extension INotification where Data == Void {

  static func post() {
    center.post(name: _name, object: nil, userInfo: ["data": Void()])
  }

  static func observe(on queue: OperationQueue? = nil,
                      block: @escaping () -> Void) -> RegisteredNotification {
    let queue = queue ?? .current
    let token = center.addObserver(forName: _name, object: nil, queue: queue) { _ in
      block()
    }
    let result = RegisteredNotification(token: token, center: center, name: _name)
    return result
  }

}
