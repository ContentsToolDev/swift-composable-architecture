// swift-tools-version:5.9

import CompilerPluginSupport
import PackageDescription

let package = Package(
  name: "swift-composable-architecture",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "ComposableArchitecture",
      targets: ["ComposableArchitecture"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-collections", from: "1.0.2"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    .package(url: "https://github.com/ContentsToolDev/swift-syntax-xcframeworks", branch: "main"),
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.0"),
    .package(url: "https://github.com/pointfreeco/combine-schedulers", from: "1.0.0"),
    .package(url: "https://github.com/ContentsToolDev/swift-case-paths", branch: "main"),
    .package(url: "https://github.com/pointfreeco/swift-concurrency-extras", from: "1.1.0"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "1.0.0"),
    .package(url: "https://github.com/ContentsToolDev/swift-dependencies", branch: "main"),
    .package(url: "https://github.com/pointfreeco/swift-identified-collections", from: "1.0.0"),
    .package(url: "https://github.com/ContentsToolDev/swift-macro-testing", branch: "main"),
    .package(url: "https://github.com/ContentsToolDev/swift-perception", branch: "main"),
    .package(url: "https://github.com/ContentsToolDev/swiftui-navigation", branch: "main"),
    .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.1.0"),
  ],
  targets: [
    .target(
      name: "ComposableArchitecture",
      dependencies: [
        "ComposableArchitectureMacros",
        .product(name: "CasePaths", package: "swift-case-paths"),
        .product(name: "CombineSchedulers", package: "combine-schedulers"),
        .product(name: "ConcurrencyExtras", package: "swift-concurrency-extras"),
        .product(name: "CustomDump", package: "swift-custom-dump"),
        .product(name: "Dependencies", package: "swift-dependencies"),
        .product(name: "DependenciesMacros", package: "swift-dependencies"),
        .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
        .product(name: "OrderedCollections", package: "swift-collections"),
        .product(name: "Perception", package: "swift-perception"),
        .product(name: "SwiftUINavigationCore", package: "swiftui-navigation"),
        .product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay"),
      ]
    ),
    .testTarget(
      name: "ComposableArchitectureTests",
      dependencies: [
        "ComposableArchitecture"
      ]
    ),
    .macro(
      name: "ComposableArchitectureMacros",
      dependencies: [
        .product(name: "SwiftSyntaxWrapper", package: "swift-syntax-xcframeworks"),
      ]
    ),
    .testTarget(
      name: "ComposableArchitectureMacrosTests",
      dependencies: [
        "ComposableArchitectureMacros",
        .product(name: "MacroTesting", package: "swift-macro-testing"),
      ]
    ),
    .executableTarget(
      name: "swift-composable-architecture-benchmark",
      dependencies: [
        "ComposableArchitecture",
        .product(name: "Benchmark", package: "swift-benchmark"),
      ]
    ),
  ]
)

//for target in package.targets where target.type != .system {
//  target.swiftSettings = target.swiftSettings ?? []
//  target.swiftSettings?.append(
//    .unsafeFlags([
//      "-c", "release",
//      "-emit-module-interface", "-enable-library-evolution",
//      "-Xfrontend", "-warn-concurrency",
//      "-Xfrontend", "-enable-actor-data-race-checks",
//    ])
//  )
//}
