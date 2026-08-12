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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/0.2.0/ClipParse.xcframework.zip",
            checksum: "3c0a7271dafe0228007641a6cc4692243a6eb4248f0cfd302650f37322c3c6f9"
        )
    ]
)
