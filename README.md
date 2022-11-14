# About

This library is for embedding video streams from the Videeo commerce platform into your iOS application.

# Prerequisites

To integrate Videeo streams into your application, you must have an active account.  To create an account go to (https://www.videeo.live/get-started/)

# Requirements

Videeo SDK is compatible with:

- iOS 14 or greater.
- Xcode 13+ or greater.
- Swift 5.6 or greater.

# How to add the Videeo SDK to your project.

The Videeo SDK can be added via Swift Package Manager, CocoaPods, or manually imported.

## SPM

In your Xcode project, select File > Swift Packages > Add Package Dependency and enter the following URL: 
`https://github.com/CommentSold/iOS-Videeo/`

> If you are new to Xcode's Swift Package Manager integration, please refer to Apple's documentation on
> [Adding a Package Dependency to Your App](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## CocoaPods

Add VideeoSDK in your Podfile: `pod VideeoSDK` and then run `pod install`.

> If you are new to CocoaPods, please refer to the documentation on
> [CocoaPods Guides](https://guides.cocoapods.org)

## Manual XCFramework Integration

- Download the SDK binary from the latest release and unzip the XCFramework into your project structure.
- Open your Xcode project, select your project file, and select your app target and the General tab.
- Drag the unzipped VideoSDK.xcframework into the section of the General tab called Frameworks, Libraries, and Embedded Content.  Make sure you select Embed and Sign.
- Your project should look like the following:
![Screen Shot 2022-10-24 at 9 07 16 AM](https://user-images.githubusercontent.com/1322203/197532729-c3d23bd0-912a-4b01-88ab-1dd1bcaba7ee.png)

# Using the Videeo SDK

## Sample Code

There are example projects for both Swift (UIKit and SwiftUI) and Obj-c in the Demo folder for this repo.

## Initialization

To initialize the Videeo SDK you will need the shop ID.
- Log in to the admin dashboard (https://go.videeo.com).
- Click the `Connect Channel` link.
- Click the `Get Embed Code` button.  
- Copy the `shopName` value from the script tag.

The `VideeoManager` is a singleton class that exposes all of the public APIs for the Videeo SDK.  Before calling any of the `VideeoManager` functions, you must first call the `initialize` function and pass a `VideeoConfig`.

## Detecting Live Streams

Once initialized, the `VideeoManger` will begin checking to see if a live event for your shop is currently running.  When the `VideeoManger` detects the live stream has started or stopped, it will dispatch a `videeoLiveStatusChanged` notification with the updated state.  You can also check the `VideeoManager.instance.isLive` property at any time to check the current status.
```
NotificationCenter.default.addObserver(
	forName: .videeoLiveStatusChanged,
	object: VideeoManager.instance,
	queue: nil) { notification in
		if let userInfo = notification.userInfo, let isLive = userInfo["isLive"] as? Bool {
			print("The live stream is happening: \(isLive)")
		}
	}
```

When the app detects that a live stream is running, you can use the `VideeoManager.instance.getLiveStreamViewController` function to create the `VideeoViewController`.  We recommend presenting the `VideeoViewController` fullscreen for the best user experience.  

## Override Default Behavior of the Stream Viewer

To override the default behavior of the `VideeoViewController`, you can provide a `VideeoStreamDelegate` to the `getLiveStreamViewController` function. To override the default behavior, you simply need to return `true` from the delegate functions.
```
/// The shopButtonTapped function will be triggered when the user taps on the shop button.
/// The default behavior will open the bottom products tray and highlight the current product.
/// Return true to override the default behavior.
/// - Parameter currentProduct: The product that is currently being shown in the
///  product overlay.
/// - Returns: Boolean indicating if the host app is overriding the default behavior.
func shopButtonTapped(currentProduct: VideeoProduct?) -> Bool


/// The productOverlayTapped function will be triggered when the user taps on the product overlay.
/// The default behavior will show the overlay product details in an SFSafariViewController.
/// Return true to override the default behavior.
/// - Parameter product: The product that is currently being shown in the product overlay.
/// - Returns: Boolean indicating if the host app is overriding the default behavior.
func productOverlayTapped(product: VideeoProduct) -> Bool

/// The productDetailTapped function will be triggered when the user taps on a product in the
/// bottom products tray.  The default behavior will show the product details in an SFSafariViewController.
/// Return true to override the default behavior.
/// - Parameter product: The tapped product.
/// - Returns: Boolean indicating if the host app is overriding the default behavior.
func productDetailTapped(product: VideeoProduct) -> Bool

/// The streamEnded function is called when the current stream ends.  The default behavior
/// will present a dialog indicating that the live stream has ended, and allow the user to dismiss
/// the VideeoViewController.  Return true to override the default behavior.
/// - Returns: Boolean indicating if the host app is overriding the default behavior.
func streamEnded() -> Bool

/// The userRemovedFromLive function is triggered when the user has been blocked by the shop
/// admin for bad behavior.  The default behavior is to do nothing.  Return true to override the default behavior.
/// - Returns: Boolean indicating if the host app is overriding the default behavior.
func userRemovedFromLive() -> Bool

/// The unhandledException function will be triggered when the SDK cannot reasonably handle
/// an error condition.
/// - Parameter error: The VideeoError that was not handled by the Videeo SDK.
/// - Returns: Boolean indicating if the host app is overriding the default behavior.
func unhandledException(error: VideeoError)
```
