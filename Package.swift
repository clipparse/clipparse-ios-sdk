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
            url: "https://github.com/clipparse/clipparse-ios-sdk/releases/download/0.1.0/ClipParse.xcframework.zip",
            checksum: "5b226145fd908cffe0e5386d92576625dd46aac02212b4bafc379355ca280fc7"
        )
    ]
)
