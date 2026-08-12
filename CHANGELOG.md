# Changelog

All notable changes to the ClipParse iOS SDK will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-08-11

### Added

- Initial release of the ClipParse SDK for iOS 15+ and macOS 12+, distributed as a precompiled XCFramework via Swift Package Manager.
- `ClipParseClient` with async `extract(_:)` for extracting structured recipes (ingredients, steps, servings, timings) from TikTok and Instagram video links.
- Typed `ClipParseError` with an `isRetryable` flag for transient failures.

[0.1.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/0.1.0
