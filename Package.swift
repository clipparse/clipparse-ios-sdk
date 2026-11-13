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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/1.4.0/ClipParse.xcframework.zip",
            checksum: "e8064b3854678fb71f7a0ac9534389e668e7a1d20276ebb7d58b49c887b62692"
        )
    ]
)
