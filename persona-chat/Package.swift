// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "persona-chat",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(name: "persona-chat", targets: ["persona-chat"]),
    ],
    targets: [
        .target(
            name: "persona-chat",
            dependencies: [],
            resources: [
                .process("Media.xcassets")
            ]
        ),
    ]
)
