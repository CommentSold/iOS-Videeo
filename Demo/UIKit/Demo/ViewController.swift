//
//  ViewController.swift
//  Demo
//
//  Created by Jared Green on 10/17/22.
//

import UIKit
import VideeoSDK


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                    self?.alertStreamIsLive()
                }
            }
    }
    
    @IBAction func showLive(_ sender: Any) {
        showLiveStream()
    }
    
    private func alertStreamIsLive() {
        guard self.presentedViewController == nil else { return }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.showLiveStream()
        }
        
        let alertController = UIAlertController(title: "Watch live stream?", message: nil, preferredStyle: .alert)
        alertController.addAction(okAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alertController, animated: true)
    }
    
    private func showLiveStream() {
        if let videeoVC = try? VideeoManager.instance.getLiveStreamViewController(delegate: self) {
            videeoVC.modalPresentationStyle = .fullScreen
            present(videeoVC, animated: true)
        }
    }

}

extension ViewController: VideeoStreamDelegate {
    func shopButtonTapped(currentProduct: VideeoProduct?) -> Bool {
        return false
    }

    func productOverlayTapped(product: VideeoProduct) -> Bool {
        return false
    }

    func productDetailTapped(product: VideeoProduct) -> Bool {
        return false
    }

    func streamEnded() -> Bool {
        return false
    }

    func userRemovedFromLive() -> Bool {
        return false
    }
}

