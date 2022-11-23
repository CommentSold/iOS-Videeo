Pod::Spec.new do |spec|
  spec.name                     = "VideeoSDK"
  spec.version                  = "0.1.5"
  spec.summary                  = "VideeoSDK"
  spec.homepage                 = "https://github.com/CommentSold/iOS-Videeo"
  spec.license                  = { :text => "Copyright 2022 CommentSold, LLC.", :type => "Copyright" }
  spec.author                   = { 'CommentSold Mobile Team' => 'mobile@commentsold.com' }
  spec.platform                 = :ios, "14.0"
  spec.module_name              = "VideeoSDK"
  spec.source                   = { :http => "https://github.com/CommentSold/iOS-Videeo/releases/download/v#{spec.version}/VideeoSDK-v#{spec.version}.xcframework.zip" }
  spec.preserve_paths           = "VideeoSDK.xcframework"
  spec.ios.vendored_frameworks  = "VideeoSDK.xcframework"
  spec.frameworks               = "AVFoundation"
  spec.cocoapods_version        = '>= 1.10.0'
end
