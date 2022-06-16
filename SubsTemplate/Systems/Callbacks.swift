//
//  Callbacks.swift
//
//  Created by dDomovoj on 12/21/21.
//  Copyright © 2021 AppsTea. All rights reserved.
//

import Foundation

fileprivate final class DeinitBag {

  var objects = [AnyObject]()

}

private enum DeinitBagKeys {
  static var onDeinit: UInt = 0
}

final class Callbacks {

  final class Cancellable {

    private var onCancel: (() -> Void)?

    // MARK: - Init

    fileprivate init(_ onCancel: @escaping () -> Void) {
      self.onCancel = onCancel
    }

    deinit {
      cancel()
    }

    // MARK: - Public

    func cancel() {
      onCancel?()
      onCancel = nil
    }

    func bindLifetime(to object: AnyObject) {
      let bag = objc_getAssociatedObject(object, &DeinitBagKeys.onDeinit) as? DeinitBag ?? DeinitBag()
      bag.objects.append(self)
      objc_setAssociatedObject(object, &DeinitBagKeys.onDeinit, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

  }

  fileprivate struct Id: Hashable {
    private let uuid: UUID

    init() { uuid = .init() }
  }

  typealias Callback = () -> Void
  fileprivate var list: [Id: Callback] = [:]

  func add(_ callback: @escaping Callback) -> Callbacks.Cancellable {
    let id = Id()
    list[id] = callback
    return Callbacks.Cancellable { [weak self] in self?.list[id] = nil }
  }
  static func += (lhs: Callbacks, rhs: @escaping Callback) -> Callbacks.Cancellable { lhs.add(rhs) }

  func once(_ callback: @escaping Callback) {
    var token: Callbacks.Cancellable?
    token = add {
      callback()
      token?.cancel()
      token = nil
    }
  }

  func removeAll() { list.removeAll() }

  func callAsFunction() { list.values.forEach { $0() } }

}

final class GenericCallbacks<Params, Result> {

  fileprivate typealias Id = Callbacks.Id
  typealias Callback = (Params) -> Result
  private var list: [Id: Callback] = [:]

  func add(_ callback: @escaping Callback) -> Callbacks.Cancellable {
    let id = Id()
    list[id] = callback
    return Callbacks.Cancellable { [weak self] in self?.list[id] = nil }
  }
  static func += (lhs: GenericCallbacks, rhs: @escaping Callback) -> Callbacks.Cancellable { lhs.add(rhs) }

  func once(_ callback: @escaping Callback) {
    var token: Callbacks.Cancellable?
    token = add {
      let result = callback($0)
      token?.cancel()
      token = nil
      return result
    }
  }

  func removeAll() { list.removeAll() }

  @discardableResult
  func callAsFunction(_ params: Params) -> [Result] { list.values.map { $0(params) } }

}
