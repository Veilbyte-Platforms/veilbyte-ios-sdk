// swift-tools-version: 6.0
import PackageDescription

let version = "0.1.0"
let baseURL = "https://github.com/Veilbyte-Platforms/veilbyte-ios-sdk/releases/download/v\(version)"

let package = Package(
    name: "VeilByteSDK",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "VeilByteCore", targets: ["VeilByteCore"]),
        .library(name: "VeilByteAuth", targets: ["VeilByteAuth"]),
        .library(name: "VeilBytePush", targets: ["VeilBytePush"]),
    ],
    targets: [
        .binaryTarget(
            name: "VeilByteCore",
            url: "\(baseURL)/VeilByteCore.xcframework.zip",
            checksum: "7057bf1a9343164909e3107b87cffe10437c4287f5de936d07ea691367fa6e5f"
        ),
        .binaryTarget(
            name: "VeilByteAuth",
            url: "\(baseURL)/VeilByteAuth.xcframework.zip",
            checksum: "3c62f671102f6b988128da6ff632f2681b2899c7644adba0819df0ded2b05fef"
        ),
        .binaryTarget(
            name: "VeilBytePush",
            url: "\(baseURL)/VeilBytePush.xcframework.zip",
            checksum: "e06a2b85529c90c6e06c27486e91f64159ca3f37a26def28b16559513b4fa3a5"
        ),
    ]
)
