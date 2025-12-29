// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "BottomSheetCorners",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "BottomSheetCorners",
            targets: ["BottomSheetCorners"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BottomSheetCorners",
            dependencies: [],
            path: "Sources/BottomSheetCorners"
        ),
        .testTarget(
            name: "BottomSheetCornersTests",
            dependencies: ["BottomSheetCorners"],
            path: "Tests/BottomSheetCornersTests"
        ),
    ]
)

