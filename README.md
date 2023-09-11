# About

This library is for embedding video streams from the Videeo commerce platform into your iOS application.

# Prerequisites

To integrate Videeo streams into your application, you must have an active account with a shop ID. 

- [Create an account](https://www.videeo.live/get-started/).
- Get the shop ID
  - [Login to admin dasboard](https://go.videeo.com).
  - Click the `Connect Channel` link.
  - Click the `Get Embed Code` button.  
  - Copy the `shopName` value from the script tag. This value is your shop ID and will be used to configure the Videeo SDK.

# Requirements

Videeo SDK is compatible with:

- iOS 14 or greater.
- Xcode 13+ or greater.
- Swift 5.6 or greater.

# How to add the Videeo SDK to your project.

The Videeo SDK can be added via Swift Package Manager, CocoaPods, or manually imported.

## Swift Package Mananger

In your Xcode project, select File > Swift Packages > Add Package Dependency and enter the following URL: 
`https://github.com/CommentSold/iOS-Videeo/`

> If you are new to Xcode's Swift Package Manager integration, please refer to Apple's documentation on
> [Adding a Package Dependency to Your App](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## CocoaPods

Add VideeoSDK in your Podfile: `pod VideeoSDK` and then run `pod install`.

> If you are new to CocoaPods, please refer to the documentation on
> [CocoaPods Guides](https://guides.cocoapods.org)

## Manual XCFramework Integration

- Download the SDK binary from the latest [release](https://github.com/CommentSold/iOS-Videeo/releases), and unzip the XCFramework into your project structure.
- Open your Xcode project, select your project file, and select your app target and the General tab.
- Drag the unzipped VideoSDK.xcframework into the section of the General tab called Frameworks, Libraries, and Embedded Content. Make sure you select Embed and Sign.
- Your project should look like the following:
![Screen Shot 2022-10-24 at 9 07 16 AM](https://user-images.githubusercontent.com/1322203/197532729-c3d23bd0-912a-4b01-88ab-1dd1bcaba7ee.png)

# Using the Videeo SDK

## Initialization

The `VideeoManager` is a singleton class that exposes all of the public APIs for the Videeo SDK. Before calling any of the `VideeoManager` functions, you must first call the `initialize` function and pass a `VideeoConfig` and optional `VideeoUser`. The `VideeoConfig` is where you will specify the shop ID, locale, currency, environment (production vs. test), and if your app supports picture-in-picture. The Videeo SDK is localized into English, Spanish, German, French, Hungarian, Italian, Polish, and Portuguese. It currently only supports the USD currency. The `VideeoUser` is how the host app provides the identity of the user to the Videeo SDK. The `Videeo User` can be supplied at initialization, and can be upated at any time during the lifecyce of the app if the users identity changes. If no user data is supplied to the Videeo SDK, then the comment features will be disabled when viewing a live stream. 

## Live Streams

### Start a Live Stream
 
- Log in to the admin dashboard (https://go.videeo.com).
- Click on the `Go Live` tab.
- Enter the title and decription for the live.
- Select where you want to broadcast the live stream.
- Click the `Go Live` button.

### Show the Live Stream in your App.

Once initialized, the `VideeoManger` will begin checking to see if a live event for your shop is currently running. When the `VideeoManger` detects the live stream has started or stopped, it will dispatch a `videeoLiveStatusChanged` notification with the updated state. You can also check the `VideeoManager.instance.isLive` property at any time to check the current status.
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

Once the app detects that a live stream is running, you can use the `getLiveStreamViewController` or `getLiveStreamView` functions to get a UIViewController or SwiftUI view respectively from the `VideeoManager`. We recommend presenting the stream viewer fullscreen for the best user experience.

## Stream Viewer Customization.

The `VideeoStreamDelegate` allows the host app to react to events that happen in stream viewer. Each of the following functions represent key integration points, where your app can both be notified and/or override the default behavior of the stream viewer.
```
/// The productTapped function will be triggered when the user taps on the product, either
/// in the product overlay or in the bottom product tray.
/// The default behavior will show the product details in a web view.
/// To override, simply return your own custom UIViewController.
/// - Parameter product: The product that has been selected.
/// - Parameter presenter: A presenter object that can be used to show either a web view or
/// a custom view for the product details.
func productTapped(product: VideeoProduct, presenter: ProductPresenter)

/// The cartTapped function will be triggered when the user taps on the cart button.
/// To get the cart button to appear, set the showCartButton to true in the VideeoConfig.
/// - Parameter presenter: A presenter object that can be called to show a custom cart view.
func cartTapped(presenter: CartPresenter)

/// The close function will be triggered when the it's time to close the stream viewer.
/// Since the host app has presented the stream viewer, the host app will be responsible
/// to close the stream viewer in the appropriate manner.
func close()

/// A guest user has performed an action that requires authentication, like trying to comment
/// on a live stream.  This delegate function provides an opportunity for the host app
/// to prompt the user for authentication.
func userAuthenticationRequired()

/// The streamEnded function is called when the current stream ends.  The default behavior
/// will present a dialog indicating that the live stream has ended, and allow the user to dismiss
/// the videeo view controller.  Return true to override the default behavior.
/// - Returns: Boolean indicating if the host app is overriding the default behavior.
func streamEnded() -> Bool

/// The userRemovedFromLive function is triggered when the user has been blocked by the shop
/// admin for bad behavior.  The default behavior is to do nothing.  Return true to override the default behavior.
/// - Returns: Boolean indicating if the host app is overriding the default behavior.
func userRemovedFromLive() -> Bool
```

## Replay Streams

Replays are Videeo streams saved for later consumption. Call `getReplayStreams` to get a page of replay data, that the host app can use to displays it's own list of replays. Each page consists of a boolean indicating if there are additional replays left to be read and an array of `VideeoStream` objects. The last `VideeoStream` ID can be used to read the next page of replays. When a replay is selected `getReplayViewController` or `getReplayView` can be used to get the stream viewer to display the replay.

## Example Integrations

- [Swift/SwiftUI Example](https://github.com/CommentSold/iOS-Videeo/tree/main/Demo/SwiftUI)
- [Swift/UIKit Example](https://github.com/CommentSold/iOS-Videeo/tree/main/Demo/UIKit)
- [Objective-C/UIKit Example](https://github.com/CommentSold/iOS-Videeo/tree/main/Demo/ObjcTest)
