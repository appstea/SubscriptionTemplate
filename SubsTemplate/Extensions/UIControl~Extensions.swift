//
//  UIControl~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/16/22.
//

import UIKit

extension UIControl.Event: Hashable { }

extension UIControl {

  private enum Keys {
    static var action: UInt = 0
  }

  typealias ActionBlock = (UIControl.Event) -> Void
  private(set) var actions: [UIControl.Event: [ActionBlock]] {
    get { objc_getAssociatedObject(self, &Keys.action) as? [UIControl.Event: [ActionBlock]] ?? [:] }
    set { objc_setAssociatedObject(self, &Keys.action, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
  }

  func addAction(for event: UIControl.Event = [.touchUpInside], block: @escaping ActionBlock) {
    var actions = self.actions[event] ?? []
    actions.append(block)
    self.actions[event] = actions
    addTarget(self, action: #selector(trigger(_:event:)), for: event)
  }

  func removeActions(for event: UIControl.Event) {
    actions[event] = nil
  }

  func hitArea() -> CGRect {
    let minSize: CGFloat = 44
    let hitSize = CGSize(width: max(minSize, bounds.size.width),
                         height: max(minSize, bounds.size.height))
    let hitArea = CGRect(x: bounds.midX - hitSize.width * 0.5,
                         y: bounds.midY - hitSize.height * 0.5,
                         width: hitSize.width,
                         height: hitSize.height)
    return hitArea
  }

}

private extension UIControl {

  @objc
  func trigger(_ sender: UIControl, event: UIControl.Event) {
    actions//.filter { event.contains($0.key) }
      .forEach { event, actions in
        actions.forEach { $0(event) }
      }
  }
}
