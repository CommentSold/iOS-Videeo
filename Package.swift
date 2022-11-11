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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.1.3/VideeoSDK-v0.1.3.xcframework.zip",
                      checksum: "ccd3863f4820a7b33820ce6a8aa88e8f9d57910ab777157db7263cdb4b3b9f91"),
    ]
    
)
