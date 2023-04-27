// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SugarKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SugarKit",
            targets: ["SugarKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Gishyan93/SugarFAB.git", branch: "main"),
        .package(url: "https://github.com/Gishyan93/SugarToast.git", branch: "main")
    ],
    targets: [
        .target(
            name: "SugarKit",
            dependencies: [
                .product(name: "SugarFAB", package: "SugarFAB"),
                .product(name: "SugarToast", package: "SugarToast"),
            ],
            swiftSettings: [
                .unsafeFlags([
                    "-Xfrontend", "-disable-implicit-concurrency-module-import",
                    "-Xfrontend", "-enable-experimental-concurrency"
                ])
            ],
            linkerSettings: [
                .linkedLibrary("SwiftConcurrency")
            ]),
        .testTarget(
            name: "SugarKitTests",
            dependencies: ["SugarKit"]),
    ]
)
