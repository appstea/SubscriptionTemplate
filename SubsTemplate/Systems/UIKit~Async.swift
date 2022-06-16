//
//  UIKit~Async.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/16/22.
//

import UIKit

protocol IAsyncable { }

extension IAsyncable {
  var async: Async<Self> { .init(self) }
  static var async: Async<Self.Type> { .init(self) }
}

struct Async<Base> {

  let base: Base
  static var base: Base.Type { Base.self }

  fileprivate init(_ base: Base) {
    self.base = base
  }

}

extension UIView: IAsyncable { }
extension Async where Base == UIView {

  @MainActor
  @discardableResult
  static func animate(duration: TimeInterval,
                      delay: TimeInterval? = nil,
                      options: UIView.AnimationOptions? = nil,
                      animations: @escaping () -> Void) async -> Bool {
    await withCheckedContinuation { (c: CheckedContinuation<Bool, Never>) in
      let delay = delay ?? 0
      let options = options ?? []
      base.animate(withDuration: duration, delay: delay, options: options, animations: animations) { result in
        c.resume(returning: result)
      }
    }
  }

}

extension UIViewController: IAsyncable { }
extension Async where Base: UIViewController {

  @MainActor
  func dismiss(animated: Bool) async {
    await withCheckedContinuation { (c: CheckedContinuation<Void, Never>) in
      base.dismiss(animated: animated) {
        c.resume(returning: Void())
      }
    }
  }

  @MainActor
  func present(_ viewContrller: UIViewController, animated: Bool) async {
    await withCheckedContinuation { (c: CheckedContinuation<Void, Never>) in
      base.present(viewContrller, animated: animated) {
        c.resume(returning: Void())
      }
    }
  }

}

