// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLintBinary",
    products: [
        .plugin(name: "SwiftLintBuildToolPlugin", targets: ["SwiftLintBuildToolPlugin"]),
        .plugin(name: "SwiftLintCommandPlugin", targets: ["SwiftLintCommandPlugin"])
    ],
    targets: [
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/swiftty/SwiftLintBinary/releases/download/0.58.1/SwiftLintBinary.artifactbundle.6.0.2.zip%0A36391ccdf5e7804ff88c736e215786e2ca827e9d942e01b179c5431b06484902",
            checksum: "b61604a0c9e0957458fa47affc9305e355f5ccb9785fb2c2f5e80a1d9c0ac3fa"
        ),
        .plugin(
            name: "SwiftLintBuildToolPlugin",
            capability: .buildTool(),
            dependencies: [
                "SwiftLintBinary"
            ]
        ),
        .plugin(
            name: "SwiftLintCommandPlugin",
            capability: .command(intent: .custom(verb: "swiftlint", description: "SwiftLint Command Plugin")),
            dependencies: [
                "SwiftLintBinary"
            ]
        )
    ]
)
