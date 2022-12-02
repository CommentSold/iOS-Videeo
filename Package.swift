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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.2.0/VideeoSDK-v0.2.0.xcframework.zip",
                      checksum: ""c651312382d0b7cac888e21928aae6b04ac941eb5db8efa5a9d35fd526b94329),
    ]
    
)
