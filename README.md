# SwiftLint Pre-build executable binary for SwiftPM plugins

This repository distributes a pre-built executable binary for [SwiftLint](https://github.com/realm/SwiftLint) that can be used with Swift Package Manager plugins.

## Installation

To dependencies,
```swift
.package(url: "https://github.com/swiftty/SwiftLintBinary.git", from: "0.54.0")
```

To each targets,

```swift
.plugin(name: "SwiftLintPlugin", package: "SwiftLintBinary")
```
