// swift-tools-version: 6.0
import PackageDescription

let version = "1.0.0"
let baseURL = "https://github.com/veilbyte/veilbyte-ios-sdk/releases/download/v\(version)"

let package = Package(
    name: "VeilByteSDK",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "VeilByteCore", targets: ["VeilByteCore"]),
        .library(name: "VeilByteAuth", targets: ["VeilByteAuth"]),
        .library(name: "VeilBytePush", targets: ["VeilBytePush"]),
    ],
    targets: [
        // Binary frameworks from GitHub Releases
        .binaryTarget(
            name: "VeilByteCoreBinary",
            url: "\(baseURL)/VeilByteCore.xcframework.zip",
            checksum: "CHECKSUM_PLACEHOLDER"
        ),
        .binaryTarget(
            name: "VeilByteAuthBinary",
            url: "\(baseURL)/VeilByteAuth.xcframework.zip",
            checksum: "CHECKSUM_PLACEHOLDER"
        ),
        .binaryTarget(
            name: "VeilBytePushBinary",
            url: "\(baseURL)/VeilBytePush.xcframework.zip",
            checksum: "CHECKSUM_PLACEHOLDER"
        ),

        // Wrapper targets that re-export binaries and declare inter-module dependencies
        .target(
            name: "VeilByteCore",
            dependencies: ["VeilByteCoreBinary"],
            path: "Sources/VeilByteCore"
        ),
        .target(
            name: "VeilByteAuth",
            dependencies: ["VeilByteAuthBinary", "VeilByteCore"],
            path: "Sources/VeilByteAuth"
        ),
        .target(
            name: "VeilBytePush",
            dependencies: ["VeilBytePushBinary", "VeilByteCore"],
            path: "Sources/VeilBytePush"
        ),
    ]
)
