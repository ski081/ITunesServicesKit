// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITunesServicesKit",
    products: [
        .library(
            name: "ITunesServicesKit",
            targets: ["ITunesServicesKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ITunesServicesKit",
            dependencies: []),
        .testTarget(
            name: "ITunesServicesKitTests",
            dependencies: ["ITunesServicesKit"]),
    ]
)
