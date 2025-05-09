// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription
import Foundation

let skipstone = [Target.PluginUsage.plugin(name: "skipstone", package: "skip")]

let package = Package(
    name: "skipapp-lottiedemo",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "LottieDemoApp", type: .dynamic, targets: ["LottieDemo"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.4.0"),
        .package(url: "https://source.skip.tools/skip-ui.git", from: "1.27.0"),
        .package(url: "https://source.skip.tools/skip-motion.git", "0.0.0"..<"2.0.0")
    ],
    targets: [
        .target(name: "LottieDemo", dependencies: [.product(name: "SkipUI", package: "skip-ui"), .product(name: "SkipMotion", package: "skip-motion")], resources: [.process("Resources")], plugins: skipstone),
        .testTarget(name: "LottieDemoTests", dependencies: ["LottieDemo", .product(name: "SkipTest", package: "skip")], resources: [.process("Resources")], plugins: skipstone),
    ]
)
