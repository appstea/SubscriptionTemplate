//
//  Analytics~Logger.swift
//
//  Created by dDomovoj on 12/2/20.
//  Copyright © 2022 AppsTea. All rights reserved.
//

import Foundation

protocol IAnalyticsLogger {

  func sendEventIfNeeded(_ event: IAnalyticsEvent)

}
