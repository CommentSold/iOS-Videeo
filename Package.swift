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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.2.1/VideeoSDK-v0.2.1.xcframework.zip",
                      checksum: "ab269fd6bbf7fa54773937a360df9ccbcadedb8840fb134e96cb3e0582e3b82e"),
    ]
    
)
