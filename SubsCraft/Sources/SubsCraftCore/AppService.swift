//
//  AppService.swift
//
//  Created by dDomovoj on 6/22/22.
//

import UIKit

public protocol IAppService: UIApplicationDelegate, UISceneDelegate { }

open class AppService: NSObject, IAppService {

  public typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]
  public typealias OpenURLOptions = [UIApplication.OpenURLOptionsKey: Any]
  public typealias UserInfo = [AnyHashable: Any]
  public typealias ResponseInfo = [AnyHashable: Any]
  public typealias BackgroundFetchResultHandler = (UIBackgroundFetchResult) -> Swift.Void
  public typealias UserInfoHandler = (UserInfo?) -> Swift.Void
  public typealias RestorationHandler = ([UIUserActivityRestoring]?) -> Swift.Void

}
