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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/1.0.1/ClipParse.xcframework.zip",
            checksum: "0e474ef2d872ce06f0dc52f9317c4e8508e104b84654f4b31fc62b8b629744fa"
        )
    ]
)
