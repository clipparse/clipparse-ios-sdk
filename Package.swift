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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/1.6.0/ClipParse.xcframework.zip",
            checksum: "eb439f12487d586f36e974e4cc18eb8a0c1baa2cf12807663407195d5375c51f"
        )
    ]
)
