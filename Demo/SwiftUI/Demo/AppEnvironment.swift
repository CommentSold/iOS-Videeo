//
//  AppEnvironment.swift
//  Demo
//
//  Created by Jared Green on 10/21/22.
//

import Foundation
import VideeoSDK
import UIKit

class AppEnvironment: ObservableObject {

    @Published var showLiveStreamAlert = false

    init() {
        //Configure the Videeo Manager with the shop name, environment and user.
        //The user parameter is option in the initialize function and can be supplied
        //directly to the VideeoManager at any point in the app lifecycle by calling setVideeoUser.
        let config = VideeoConfig(shopID: "jaredvideeo", environment: .staging)
        let videeoUser = VideeoUser(firstName: "Jared", lastName: "Green", facebookId: "123", instagramId: "456", tiktokId: "789")
        VideeoManager.instance.initialize(config: config, videeoUser: videeoUser)

        //Register for videeo status events so the app will be notifed if a live stream starts or stops.
        NotificationCenter.default.addObserver(
            forName: .videeoLiveStatusChanged,
            object: VideeoManager.instance,
            queue: nil) { [weak self] notification in
                if let userInfo = notification.userInfo, let isLive = userInfo["isLive"] as? Bool, isLive {
                    self?.showLiveStreamAlert = true
                }
            }
    }
}

extension AppEnvironment: VideeoStreamDelegate { }

