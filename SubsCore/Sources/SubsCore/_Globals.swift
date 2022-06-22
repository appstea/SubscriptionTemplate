//
//  _Globals.swift
//
//  Created by dDomovoj on 6/22/22.
//

import Foundation
import UIKit

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]
typealias OpenURLOptions = [UIApplication.OpenURLOptionsKey: Any]
typealias UserInfo = [AnyHashable: Any]
typealias ResponseInfo = [AnyHashable: Any]
typealias VoidHandler = () -> Swift.Void
typealias BoolHandler = (Swift.Bool) -> Swift.Void
typealias BackgroundFetchResultHandler = (UIBackgroundFetchResult) -> Swift.Void
typealias UserInfoHandler = (UserInfo?) -> Swift.Void
typealias RestorationHandler = ([UIUserActivityRestoring]?) -> Swift.Void

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
