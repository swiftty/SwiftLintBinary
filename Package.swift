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
            url: "https://github.com/swiftty/SwiftLintBinary/releases/download/0.54.0/SwiftLintBinary.artifactbundle.5.9.zip",
            checksum: "754796194c959375c2657c842ed83da2806a1c5cc3832f2f05f0989127ec1a5d"
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
