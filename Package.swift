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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v1.0.0/VideeoSDK-v1.0.0.xcframework.zip",
                      checksum: "e0c3237a58e5268e782ed330dccd40cb51bf24da066310254c9a384329ad52ce"),
    ]
    
)
