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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/1.3.0/ClipParse.xcframework.zip",
            checksum: "1c1e82ad911b31796a7e3231135c550ccec2a56fb0c0e8e0c936f12e5d346a99"
        )
    ]
)
