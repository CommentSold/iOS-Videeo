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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.1.0/VideeoSDK-v0.1.0.xcframework.zip",
                      checksum: "4a5f29f1b10a763db82f43022e13bb583541712b4692a5766c6542546b11d676"),
    ]
    
)
