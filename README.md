# ClipParse iOS SDK

The official ClipParse SDK for Apple platforms, distributed as a precompiled XCFramework via Swift Package Manager.

## Requirements

- iOS 15.0+ / macOS 12.0+
- Swift 5.9+ / Xcode 15+

## Installation

### Swift Package Manager

In Xcode, go to **File → Add Package Dependencies…** and enter:

```
https://github.com/clipparse/clipparse-ios-sdk
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/clipparse/clipparse-ios-sdk", from: "0.1.0")
]
```

Then import it where needed:

```swift
import ClipParse
```

## Binary integrity

The SDK ships as a precompiled XCFramework. The `Package.swift` manifest pins the artifact's SHA-256 checksum, so Swift Package Manager verifies the integrity of the download automatically.

## License

This SDK is distributed under the MIT License. See [LICENSE](LICENSE) for details.
