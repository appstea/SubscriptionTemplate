//
//  Notifications~System.swift
//
//  Created by dDomovoj on 5/11/22.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation
import UIKit

extension Notification {
  enum System {

    enum WillEnterForeground: INotification {
      typealias Data = Void
      static var name: NotificationName { .notification(UIApplication.willEnterForegroundNotification) }
    }

    enum DidEnterBackground: INotification {
      typealias Data = Void
      static var name: NotificationName { .notification(UIApplication.didEnterBackgroundNotification) }
    }

    enum SignificantTimeChange: INotification {
      typealias Data = Void
      static var name: NotificationName { .notification(UIApplication.significantTimeChangeNotification) }
    }

    enum ContentSizeCategoryChange: INotification {
      typealias Data = Void
      static var name: String { UIContentSizeCategory.didChangeNotification.rawValue }
    }

    enum DidBecomeActive: INotification {
      typealias Data = Void
      static var name: NotificationName { .notification(UIApplication.didBecomeActiveNotification) }
    }

    enum WillResignActive: INotification {
      typealias Data = Void
      static var name: NotificationName { .notification(UIApplication.willResignActiveNotification) }
    }

    //  enum DidChangeStatusBarOrientation: INotification {
    //    typealias Data = UIInterfaceOrientation
    //    static var name: NotificationName { .notification(UIApplication.didChangeStatusBarFrameNotification) }
    //  }

  }
}
