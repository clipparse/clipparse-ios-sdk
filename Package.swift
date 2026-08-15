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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/1.0.0/ClipParse.xcframework.zip",
            checksum: "3a1988914d27201aea19f698cee5f5dd82e9f272dda5b1edd5cdd63225906954"
        )
    ]
)
