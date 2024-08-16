// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "YQDefaultValue",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "YQDefaultValue",
            targets: [
                "YQDefaultValue"
            ]
        )
    ],
    targets: [
        .target(
            name: "YQDefaultValue"),
    ],
    swiftLanguageVersions: [.v5]
)