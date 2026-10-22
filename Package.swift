// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ClipParse",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [.library(name: "ClipParse", targets: ["ClipParse"])],
    targets: [
        .binaryTarget(
            name: "ClipParse",
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/1.1.0/ClipParse.xcframework.zip",
            checksum: "ff36c081d0e53d2bfbef23f0614569eba59e8821d4e7d8d4a55f67c8219ac463"
        )
    ]
)
