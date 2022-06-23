// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SubsCraft",
    defaultLocalization: "en",
    platforms: [
      .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SubsCraftCore",
            targets: ["SubsCraftCore"]
        ),
        .library(
            name: "SubsCraftResources",
            targets: ["SubsCraftResources"]
        ),
        .library(
            name: "SubsCraftUI",
            targets: ["SubsCraftUI"]
        ),
    ],
    dependencies: [
      .package(name: "Cascade", path: "../Cascade"),
      .package(name: "NotificationCraft", path: "../NotificationCraft"),
      .package(name: "AnalyticsCraft", path: "../AnalyticsCraft"),
      .package(name: "Stored", path: "../Stored"),
      .package(name: "Utils", path: "../Utils"),

      .package(name: "UIBase", path: "../UIBase"),
      .package(name: "UICommon", path: "../UICommon"),
      .package(name: "CallbacksCraft", path: "../CallbacksCraft"),

      .package(url: "https://github.com/eddiekaiger/SwiftyAttributes", branch: "master"),
      .package(url: "https://github.com/layoutBox/PinLayout", .upToNextMajor(from: "1.10.3")),
      .package(url: "https://github.com/dDomovoj/StackCraft.git", .upToNextMajor(from: "0.3.3")),
      .package(url: "https://github.com/RevenueCat/purchases-ios.git", .upToNextMajor(from: "4.5.2")),
      .package(url: "https://github.com/ashleymills/Reachability.swift", branch: "master"),
      .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "9.1.0")),
      .package(url: "https://github.com/BranchMetrics/ios-branch-deep-linking-attribution", .upToNextMajor(from: "1.42.0"))
    ],
    targets: [
        .target(
            name: "SubsCraftCore",
            dependencies: [
              "SubsCraftUI",
              "SubsCraftResources",

              .product(name: "Cascade", package: "Cascade"),
              .product(name: "NotificationCraft", package: "NotificationCraft"),
              .product(name: "NotificationCraftSystem", package: "NotificationCraft"),
              .product(name: "AnalyticsCraft", package: "AnalyticsCraft"),
              .product(name: "Stored", package: "Stored"),
              .product(name: "Utils", package: "Utils"),

              .product(name: "SwiftyAttributes", package: "SwiftyAttributes"),
              .product(name: "StackCraft", package: "StackCraft"),
              .product(name: "RevenueCat", package: "purchases-ios"),
              .product(name: "Reachability", package: "Reachability.swift"),
              .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
              .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
              .product(name: "Branch", package: "ios-branch-deep-linking-attribution"),
            ],
            linkerSettings: [
              .linkedFramework("UIKit"),
              .linkedFramework("NotificationCenter"),
              .linkedFramework("StoreKit"),
              .linkedFramework("AdSupport"),
              .linkedFramework("AppTrackingTransparency"),
              .linkedFramework("SafariServices"),
            ]
        ),


        .target(
            name: "SubsCraftResources",
            dependencies: [],
            linkerSettings: [
              .linkedFramework("UIKit"),
            ]
        ),


        .target(
            name: "SubsCraftUI",
            dependencies: [
              "SubsCraftResources",

              "UIBase",
              "UICommon",
              "CallbacksCraft",

              .product(name: "PinLayout", package: "PinLayout"),
            ],
            linkerSettings: [
              .linkedFramework("UIKit"),
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
