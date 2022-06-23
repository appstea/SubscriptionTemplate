//
//  _Globals.swift
//
//  Created by dDomovoj on 6/22/22.
//

import Foundation
import UIKit

typealias VoidHandler = () -> Swift.Void
typealias BoolHandler = (Swift.Bool) -> Swift.Void

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
