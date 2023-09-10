// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLintBinary",
    products: [
        .plugin(name: "SwiftLintPlugin", targets: ["SwiftLintPlugin"]),
        .plugin(name: "SwiftLintCommandPlugin", targets: ["SwiftLintCommandPlugin"])
    ],
    targets: [
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "<url>",
            checksum: "<checksum>"
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: [
                "SwiftLintBinary"
            ]
        ),
        .plugin(
            name: "SwiftLintCommandPlugin",
            capability: .command(
                intent: .custom(
                    verb: "swiftlint",
                    description: "A tool to enforce Swift style and conventions."
                )
            ),
            dependencies: [
                "SwiftLintBinary"
            ]
        )
    ]
)
