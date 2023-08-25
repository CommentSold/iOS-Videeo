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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v1.0.1/VideeoSDK-v1.0.1.xcframework.zip",
                      checksum: "e5a29c798c316646a2ae5c032ff3ff4af674d0a55740937ee0c60dbe8d81a2d6"),
    ]
    
)
