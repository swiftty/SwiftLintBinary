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
            url: "https://github.com/swiftty/SwiftLintBinary/releases/download/0.58.2/SwiftLintBinary.artifactbundle.6.0.2.zip%0Acc0d40b6b1cb8366b6a216b63062b3906cf56808a2073a52ef9385f420a989aa",
            checksum: "5d0d442ee7364ea9ee6197f76508a08210780a50152b16455754412f9ac1b532"
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
