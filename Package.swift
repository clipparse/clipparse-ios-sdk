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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/1.5.0/ClipParse.xcframework.zip",
            checksum: "67ccca5ed831e34c3b061cf097be6889c9122adcbc3cea47057692bd8abdd856"
        )
    ]
)
