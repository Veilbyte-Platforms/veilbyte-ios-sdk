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
            checksum: "36b18f9bbf59bfd7ab0889c76cc8140ee6354085ab10ad37d891018dd0cfa6f5"
        ),
        .binaryTarget(
            name: "VeilByteAuth",
            url: "\(baseURL)/VeilByteAuth.xcframework.zip",
            checksum: "b3fccb0497957ac9085523aa9e8d630d6b23dba90e8e939e8ab376b1bb07356b"
        ),
        .binaryTarget(
            name: "VeilBytePush",
            url: "\(baseURL)/VeilBytePush.xcframework.zip",
            checksum: "44df255570440b7b1a86347ddd725078939787307002a7814c86cf66c4e5898f"
        ),
    ]
)
