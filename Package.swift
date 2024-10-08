// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KYFoundation",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
    ],
    products: [
        .library(name: "KYFoundation", targets: ["KYFoundation"]),
    ],
    targets: [
        .target(
            name: "KYFoundation"
        ),
    ]
)
