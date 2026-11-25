# ClipParse iOS SDK

The official ClipParse SDK for iOS and macOS: add recipe import from TikTok and Instagram links to your Swift or SwiftUI app. Pass a post's link and get back the recipe as structured data: the title, ingredients with quantities and units, ordered steps, timings and servings. Distributed as a precompiled XCFramework via Swift Package Manager.

- [Guide: import recipes from TikTok and Instagram links in an iOS app](https://docs.clipparse.com/guides/import-recipes-from-tiktok-instagram-ios), with a SwiftUI screen and the share sheet
- [API reference](https://docs.clipparse.com/): every recipe field and outcome
- [Get a free API key](https://clipparse.com/get-free-key)

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
    .package(url: "https://github.com/clipparse/clipparse-ios-sdk", from: "1.5.0")
]
```

Then import it where needed:

```swift
import ClipParse
```

## Usage

You need a ClipParse API key: get a free one at [clipparse.com/get-free-key](https://clipparse.com/get-free-key). It takes seconds and doesn't require a credit card.

Create a client with your API key, then extract a recipe from a TikTok or Instagram link:

```swift
import ClipParse

let client = ClipParseClient(apiKey: "<your API key>")

let url = URL(string: "https://www.tiktok.com/@somecreator/video/1234567890")!
switch try await client.extract(url) {
case .recipe(let recipe):
    print(recipe.title)
    print(recipe.servings ?? 0, "servings —",
          recipe.prepTimeMinutes ?? 0, "min prep,",
          recipe.cookTimeMinutes ?? 0, "min cook")
    for ingredient in recipe.ingredients {
        print(ingredient.name, ingredient.quantity ?? "", ingredient.unit?.rawValue ?? "")
    }
    for step in recipe.steps {
        print(step.text)
    }
case .noRecipe(let reason):
    print("No recipe found:", reason)
}
```

### Error handling

API failures throw a typed `ClipParseError`, so you can give users specific feedback:

```swift
do {
    let result = try await client.extract(url)
} catch ClipParseError.unsupportedPlatform {
    // Only TikTok and Instagram links are supported
} catch ClipParseError.postUnavailable {
    // The post was deleted, is private, or doesn't exist
} catch ClipParseError.invalidAPIKey {
    // Check the API key configured for this client
} catch ClipParseError.rateLimited(let retryAfter) {
    // Too many requests in a short time — wait for retryAfter seconds, then retry
} catch ClipParseError.quotaExceeded(let retryAfter) {
    // The key's allowance is spent — it resets in retryAfter seconds (nil: it doesn't reset)
} catch let error as ClipParseError where error.isRetryable {
    // Transient failure (e.g. network) — safe to retry
}
```

## Binary integrity

The SDK ships as a precompiled XCFramework. The `Package.swift` manifest pins the artifact's SHA-256 checksum, so Swift Package Manager verifies the integrity of the download automatically.

## License

The SDK is proprietary software, governed by the [ClipParse SDK License](https://clipparse.com/sdk-license). It is free to embed in your apps and to ship with them.
