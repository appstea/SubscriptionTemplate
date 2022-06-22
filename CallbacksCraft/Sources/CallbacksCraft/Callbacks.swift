//
//  Callbacks.swift
//
//  Created by dDomovoj on 12/21/21.
//

import Foundation

fileprivate final class DeinitBag {

  var objects = [AnyObject]()

}

private enum DeinitBagKeys {
  static var onDeinit: UInt = 0
}

public final class Callbacks {

  public final class Cancellable {

    private var onCancel: (() -> Void)?

    // MARK: - Init

    fileprivate init(_ onCancel: @escaping () -> Void) {
      self.onCancel = onCancel
    }

    deinit {
      cancel()
    }

    // MARK: - Public

    public func cancel() {
      onCancel?()
      onCancel = nil
    }

    public func bindLifetime(to object: AnyObject) {
      let bag = objc_getAssociatedObject(object, &DeinitBagKeys.onDeinit) as? DeinitBag ?? DeinitBag()
      bag.objects.append(self)
      objc_setAssociatedObject(object, &DeinitBagKeys.onDeinit, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

  }

  fileprivate struct Id: Hashable {
    private let uuid: UUID

    init() { uuid = .init() }
  }

  public typealias Callback = () -> Void
  fileprivate var list: [Id: Callback] = [:]

  public init() { }

  public func add(_ callback: @escaping Callback) -> Callbacks.Cancellable {
    let id = Id()
    list[id] = callback
    return Callbacks.Cancellable { [weak self] in self?.list[id] = nil }
  }
  public static func += (lhs: Callbacks, rhs: @escaping Callback) -> Callbacks.Cancellable { lhs.add(rhs) }

  public func once(_ callback: @escaping Callback) {
    var token: Callbacks.Cancellable?
    token = add {
      callback()
      token?.cancel()
      token = nil
    }
  }

  public func removeAll() { list.removeAll() }

  public func callAsFunction() { list.values.forEach { $0() } }

}

public final class GenericCallbacks<Params, Result> {

  fileprivate typealias Id = Callbacks.Id
  public typealias Callback = (Params) -> Result
  private var list: [Id: Callback] = [:]

  public init() {}

  public func add(_ callback: @escaping Callback) -> Callbacks.Cancellable {
    let id = Id()
    list[id] = callback
    return Callbacks.Cancellable { [weak self] in self?.list[id] = nil }
  }
  public static func += (lhs: GenericCallbacks, rhs: @escaping Callback) -> Callbacks.Cancellable { lhs.add(rhs) }

  public func once(_ callback: @escaping Callback) {
    var token: Callbacks.Cancellable?
    token = add {
      let result = callback($0)
      token?.cancel()
      token = nil
      return result
    }
  }

  public func removeAll() { list.removeAll() }

  @discardableResult
  public func callAsFunction(_ params: Params) -> [Result] { list.values.map { $0(params) } }

}
