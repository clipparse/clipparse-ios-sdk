# ClipParse iOS SDK

The official ClipParse SDK for Apple platforms — extract structured recipes (ingredients, steps, timings) from TikTok and Instagram video links. Distributed as a precompiled XCFramework via Swift Package Manager.

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

## Usage

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
} catch ClipParseError.invalidAPIKey {
    // Check the API key configured for this client
} catch let error as ClipParseError where error.isRetryable {
    // Transient failure (e.g. network) — safe to retry
}
```

## Binary integrity

The SDK ships as a precompiled XCFramework. The `Package.swift` manifest pins the artifact's SHA-256 checksum, so Swift Package Manager verifies the integrity of the download automatically.

## License

This SDK is distributed under the MIT License. See [LICENSE](LICENSE) for details.
