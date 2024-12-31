// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWHighTechView",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWHighTechView", targets: ["WWHighTechView"]),
    ],
    targets: [
        .target(name: "WWHighTechView", resources: [.process("Xib"), .copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
