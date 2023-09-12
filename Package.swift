// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "VideeoSDK",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "VideeoSDK",
                 targets: ["VideeoSDK"])
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(name: "VideeoSDK",
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v1.1.0/VideeoSDK-v1.1.0.xcframework.zip",
                      checksum: "0704501dc79e75ee7b4bfe5cf6cbe6ffe2821b4eb69c880df4dd7264fe6feaba"),
    ]
    
)
