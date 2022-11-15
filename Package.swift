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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.1.4/VideeoSDK-v0.1.4.xcframework.zip",
                      checksum: "76cdd7914822bc97b0a36e8bee3c9f378f7847e1c3092e7bf25d5089ddd934dc"),
    ]
    
)
