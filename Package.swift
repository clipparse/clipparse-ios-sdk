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
            checksum: "2fe12b8dd442d349dd5e7b986d458d35ae8041e995b8b9030ec779436ba5d325"
        )
    ]
)
