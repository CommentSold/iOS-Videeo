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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.3.0/VideeoSDK-v0.3.1.xcframework.zip",
                      checksum: "e6e0f3d01957f2ceda023522fa0819297108bb6e5af894e9e9412ca85a302061"),
    ]
    
)
