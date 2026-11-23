# Changelog

All notable changes to the ClipParse iOS SDK will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.6.0] - 2026-11-23

### Added

- `ClipParseClient.extract(_:)`, which extracts a recipe from a post URL.

### Changed

- More reliable TikTok extraction.

### Deprecated

- `ClipParseClient.extract(_:caption:)`. Its `caption` parameter has no effect: call `extract(_:)` instead. The method will be removed in 2.0.
- `ClipParseError.tiktokPhotoPostsUnsupported`. It is no longer thrown, since TikTok photo posts are supported. Code that matches on it still compiles but will no longer match. The case will be removed in 2.0.

## [1.5.0] - 2026-11-20

### Added

- `ClipParseError.rateLimited(retryAfter:)`, thrown when too many requests were sent in a short time (429 `rate_limited`). `retryAfter` is the time to wait, in seconds. `isRetryable` is `false`, because an immediate retry fails again.
- Requests to the ClipParse API now include an `X-SDK-Platform` header with the value `ios`, identifying the SDK.

### Changed

- `ClipParseError.quotaExceeded` is now thrown only when the API key's allowance is spent (429 `quota_exceeded`). Its `retryAfter` is the time until the allowance resets, and is `nil` when it never resets. A rate limit previously threw `quotaExceeded` too; it now throws `rateLimited`.
- `isRetryable` is now `true` for any 5xx response, including a 502, 503 or 504 that carries no ClipParse error body. Previously only a 500 was retryable.
- The SDK is now distributed under the [ClipParse SDK License](https://clipparse.com/sdk-license), in place of the MIT License.

## [1.4.0] - 2026-11-13

### Added

- `Ingredient.quantityMin` and `Ingredient.quantityMax`, the two ends of an amount given as a range ("3-4 tbsp" is 3 and 4), in the ingredient's `unit`. Both are set for a range and both are `nil` for a single amount. `Ingredient.quantity` is unchanged: for a range it is the midpoint (3.5).

## [1.3.0] - 2026-11-09

### Added

- `Unit.pt`, `Unit.qt` and `Unit.gal` for pints, quarts and gallons.

### Changed

- An ingredient unit that the installed SDK version doesn't recognize now decodes as a `nil` unit, with the original text still in `Ingredient.raw`. Previously, the whole extraction failed with a decoding error. New units can now be added to the API without breaking apps on older SDK versions.

## [1.2.0] - 2026-11-08

### Added

- `ClipParseError.postUnavailable`, thrown when the post was deleted, is private, or doesn't exist. It is not retryable: retrying the same link won't succeed. These posts previously surfaced as a server error.

## [1.1.0] - 2026-10-22

### Added

- `NoRecipeReason.noRecipeFound`, returned when a post contains no recipe to extract.

### Deprecated

- `NoRecipeReason.noRecipeInCaption` is deprecated in favor of `.noRecipeFound` and is no longer returned. Code that matches on it still compiles but will no longer match, so switch to `.noRecipeFound` (Xcode offers a rename fix-it). The deprecated case will be removed in 2.0.

## [1.0.1] - 2026-08-17

### Fixed

- Instagram extractions now include the post's thumbnail: `Recipe.thumbnailUrl`, previously always `nil` for Instagram links, is now populated whenever the server doesn't provide one.

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

[1.6.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.6.0
[1.5.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.5.0
[1.4.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.4.0
[1.3.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.3.0
[1.2.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.2.0
[1.1.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.1.0
[1.0.1]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.0.1
[1.0.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/1.0.0
[0.2.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/0.2.0
[0.1.0]: https://github.com/clipparse/clipparse-ios-sdk/releases/tag/0.1.0
