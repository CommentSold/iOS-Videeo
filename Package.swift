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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.1.5/VideeoSDK-v0.1.5.xcframework.zip",
                      checksum: "88ca11660d516d4d576a6e8894bd0af91f0521c746397359c010f34de3a5a5d1"),
    ]
    
)
