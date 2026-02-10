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
            checksum: "f7a70e44cc29b398e0f4815f957b72c0f313d6d5584503d4e693474454595753"
        ),
        .binaryTarget(
            name: "VeilByteAuth",
            url: "\(baseURL)/VeilByteAuth.xcframework.zip",
            checksum: "608d84bc4e2ed56d84e1898a5eec51784f1537e7bd44f26c1fe75208edf63172"
        ),
        .binaryTarget(
            name: "VeilBytePush",
            url: "\(baseURL)/VeilBytePush.xcframework.zip",
            checksum: "8ad0073fa1feb98a3501d8844f4f49503e38a35091c929b22b56d7c3e630eea2"
        ),
    ]
)
