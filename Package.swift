// swift-tools-version: 6.0
import PackageDescription

let version = "0.2.0"
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
            checksum: "016ea827bce086e03d1e5cafc97d240566620cdbf69a33b79a05f044182a9b35"
        ),
        .binaryTarget(
            name: "VeilByteAuth",
            url: "\(baseURL)/VeilByteAuth.xcframework.zip",
            checksum: "c3907c642f20518fc51c0358084a8bee159b3768f0edc76289aa2be1ba53551a"
        ),
        .binaryTarget(
            name: "VeilBytePush",
            url: "\(baseURL)/VeilBytePush.xcframework.zip",
            checksum: "ed9b6c79d559842ff8a1a39dcd8b28b6f06a890f1a2fb29a84eeb3e50e00332a"
        ),
    ]
)
