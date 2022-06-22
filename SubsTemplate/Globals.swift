//
//  Utils.swift
//
//  Created by dDomovoj on 9/30/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Types

typealias Continuation<T> = CheckedContinuation<T, Never>

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]
typealias OpenURLOptions = [UIApplication.OpenURLOptionsKey: Any]
typealias UserInfo = [AnyHashable: Any]
typealias ResponseInfo = [AnyHashable: Any]
typealias VoidHandler = () -> Swift.Void
typealias BoolHandler = (Swift.Bool) -> Swift.Void
typealias BackgroundFetchResultHandler = (UIBackgroundFetchResult) -> Swift.Void
typealias UserInfoHandler = (UserInfo?) -> Swift.Void
typealias RestorationHandler = ([UIUserActivityRestoring]?) -> Swift.Void

// MARK: - Vars

#if DEBUG
let isDebug = true
#else
let isDebug = false
#endif

#if ADHOC
let isAdHoc = true
#else
let isAdHoc = false
#endif

#if RELEASE
let isRelease = true
#else
let isRelease = false
#endif
