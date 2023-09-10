import Foundation
import PackagePlugin

private protocol PluginToolProviding {
    func tool(named: String) throws -> PluginContext.Tool
}

extension PluginContext: PluginToolProviding {}

@main
struct SwiftLintCommandPlugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        var extractor = ArgumentExtractor(arguments)
        _ = extractor.extractOption(named: "target")

        try run(context: context, arguments: extractor.remainingArguments)
    }

    private func run(context: PluginToolProviding, arguments: [String]) throws {
        let tool = try context.tool(named: "swiftlint")
        let toolURL = URL(fileURLWithPath: tool.path.string)

        let process = Process()
        process.executableURL = toolURL
        process.arguments = arguments

        try process.run()
        process.waitUntilExit()

        guard process.terminationReason == .exit, process.terminationStatus == 0 else {
            let problem = "\(process.terminationReason):\(process.terminationStatus)"
            Diagnostics.error("swiftlint invocation failed: \(problem)")
            return
        }
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftLintCommandPlugin: XcodeBuildToolPlugin {
    func performCommand(context: XcodePluginContext, arguments: [String]) throws {
        var extractor = ArgumentExtractor(arguments)
        _ = extractor.extractOption(named: "target")

        try run(context: context, arguments: extractor.remainingArguments)
    }
}
#endif
