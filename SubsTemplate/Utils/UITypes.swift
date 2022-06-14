//
//  UITypes.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/14/22.
//

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
