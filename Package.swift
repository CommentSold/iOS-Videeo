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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.3.0/VideeoSDK-v0.3.0.xcframework.zip",
                      checksum: "aed06b116eed21c0a3162266b801f586f007d5641f8df193c03e3d96cda4eb34"),
    ]
    
)
