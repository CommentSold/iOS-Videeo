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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.1.1/VideeoSDK-v0.1.1.xcframework.zip",
                      checksum: "8aec13c0f960be7eb2b25c3254c7026b55a7ef7d416b293a3b9ae46c8d60e6c7"),
    ]
    
)
