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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/1.2.0/ClipParse.xcframework.zip",
            checksum: "799ffeaff455624562d3156f8ca961018632c5a557b89a1b25abfd54fde95542"
        )
    ]
)
