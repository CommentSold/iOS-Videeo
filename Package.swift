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
                      url: "https://github.com/CommentSold/iOS-Videeo/releases/download/v0.1.2/VideeoSDK-v0.1.2.xcframework.zip",
                      checksum: "5480c7bdcde377fd8ab53a383d7f9ac23e7b07b145f113c49050e90ce0905a64"),
    ]
    
)
