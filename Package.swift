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
            url: "https://github.com/swiftty/SwiftLintBinary/releases/download/0.53.0/SwiftLintBinary.artifactbundle.5.8.1.zip",
            checksum: "576b0ff89536e2aa99902db13e63b8cefc3631342439992ea9a2c15125c1233b"
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
