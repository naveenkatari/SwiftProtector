import PackageDescription

let package = Package(
    name: "SwiftProtector",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SwiftProtector",
            targets: ["SwiftProtector"]),
    ],
    targets: [
        .target(
            name: "SwiftProtector"),
        .testTarget(
            name: "SwiftProtectorTests",
            dependencies: ["SwiftProtector"]),
    ]
)

