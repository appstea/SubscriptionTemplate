//
//  System.swift
//
//  Created by dDomovoj on 6/22/22.
//

import Foundation
import UIKit

import NotificationCraft

public extension Notification {

  enum System {

    public enum WillEnterForeground: INotification {
      public typealias Data = Void
      public static var name: NotificationName { .notification(UIApplication.willEnterForegroundNotification) }
    }

    public enum DidEnterBackground: INotification {
      public typealias Data = Void
      public static var name: NotificationName { .notification(UIApplication.didEnterBackgroundNotification) }
    }

    public enum SignificantTimeChange: INotification {
      public typealias Data = Void
      public static var name: NotificationName { .notification(UIApplication.significantTimeChangeNotification) }
    }

    public enum ContentSizeCategoryChange: INotification {
      public typealias Data = Void
      public static var name: String { UIContentSizeCategory.didChangeNotification.rawValue }
    }

    public enum DidBecomeActive: INotification {
      public typealias Data = Void
      public static var name: NotificationName { .notification(UIApplication.didBecomeActiveNotification) }
    }

    public enum WillResignActive: INotification {
      public typealias Data = Void
      public static var name: NotificationName { .notification(UIApplication.willResignActiveNotification) }
    }

    //  enum DidChangeStatusBarOrientation: INotification {
    //    typealias Data = UIInterfaceOrientation
    //    static var name: NotificationName { .notification(UIApplication.didChangeStatusBarFrameNotification) }
    //  }

  }
}
