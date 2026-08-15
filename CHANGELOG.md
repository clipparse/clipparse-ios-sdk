# Changelog

All notable changes to the ClipParse iOS SDK will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-08-15

### Changed

- Privacy improvements to the SDK's internal networking.
- The bundled privacy manifest (`PrivacyInfo.xcprivacy`) is now complete: it declares no tracking and no required-reason API usage, and discloses the submitted video URL as the only collected data (unlinked, app-functionality purpose only).

## [0.2.0] - 2026-08-12

### Added

- Requests to the ClipParse API now include `X-SDK-Version` and `X-Bundle-Id` headers, identifying the SDK version and calling app.

### Changed

- **Breaking:** `ClipParseError.quotaExceeded` now carries an associated `retryAfter: TimeInterval?` value with the server's suggested back-off in seconds, when provided. A 429 indicates a per-key rate limit rather than a hard quota, so use `retryAfter` to schedule a retry; `isRetryable` remains `false` because an immediate retry will not succeed.

## [0.1.0] - 2026-08-11

### Added

- Initial release of the ClipParse SDK for iOS 15+ and macOS 12+, distributed as a precompiled XCFramework via Swift Package Manager.
- `ClipParseClient` with async `extract(_:)` for extracting structured recipes (ingredients, steps, servings, timings) from TikTok and Instagram video links.
- Typed `ClipParseError` with an `isRetryable` flag for transient failures.

[1.0.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.0.0
[0.2.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/0.2.0
[0.1.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/0.1.0
