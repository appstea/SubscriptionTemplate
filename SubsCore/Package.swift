// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SubsCore",
    platforms: [
      .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SubsCore",
            targets: ["SubsCore"]
        ),
    ],
    dependencies: [
      .package(name: "Cascade", path: "../Cascade"),
      .package(name: "NotificationCraft", path: "../NotificationCraft"),
      .package(name: "AnalyticsCraft", path: "../AnalyticsCraft"),
      .package(name: "Stored", path: "../Stored"),
      .package(name: "SubsResources", path: "../SubsResources"),
      .package(name: "SubsUI", path: "../SubsUI"),
      .package(name: "Utils", path: "../Utils"),

      .package(url: "https://github.com/dDomovoj/StackCraft.git", .upToNextMajor(from: "0.3.3")),
      .package(url: "https://github.com/RevenueCat/purchases-ios.git", .upToNextMajor(from: "4.5.2")),
      .package(url: "https://github.com/ashleymills/Reachability.swift", branch: "master"),
      .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "9.1.0")),
      .package(url: "https://github.com/BranchMetrics/ios-branch-deep-linking-attribution", .upToNextMajor(from: "1.42.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SubsCore",
            dependencies: [
              .product(name: "Cascade", package: "Cascade"),
              .product(name: "NotificationCraft", package: "NotificationCraft"),
              .product(name: "NotificationCraftSystem", package: "NotificationCraft"),
              .product(name: "AnalyticsCraft", package: "AnalyticsCraft"),
              .product(name: "Stored", package: "Stored"),
              .product(name: "SubsResources", package: "SubsResources"),
              .product(name: "SubsUI", package: "SubsUI"),
              .product(name: "Utils", package: "Utils"),

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
    ]
)
