//
//  SessionService.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation
import UIKit

fileprivate extension UserStore {

  @Stored("stored.session.index", defaultValue: 0)
  static var sessionIdx: Int

  @Stored("stored.launch.index", defaultValue: 1)
  static var launchIdx: Int
}

//extension Notification {
//
//  enum Session {
//    // swiftlint:disable:next nesting
//    enum Change: INotification { typealias Data = Int }
//  }
//
//}

final class SessionService: NSObject, UIApplicationDelegate {

  var currentSessionIdx: Int { UserStore.sessionIdx }

  func applicationDidBecomeActive(_ application: UIApplication) {
    incrementSession()
  }

}

private extension SessionService {

  func incrementSession() {
    if UserStore.didPassPrepermission {
      if UserStore.sessionIdx == 0 {
        UserStore.sessionIdx += 1
        NSLog("SESSION idx: " + currentSessionIdx.description)
         // TODO: Later
//        Notification.Session.Change.post(currentSessionIdx)
      }
    }
  }
}
