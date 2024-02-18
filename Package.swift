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
            url: "https://github.com/swiftty/SwiftLintBinary/releases/download/0.54.0/SwiftLintBinary.artifactbundle.5.9.2.zip",
            checksum: "69fcdfe21f5f0e4c9c06ed7a8a7a3dc01460873cadc73b2410e830be3ead2ae6"
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
