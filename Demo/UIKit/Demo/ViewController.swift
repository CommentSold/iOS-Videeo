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
        let config = VideeoConfig(shopID: "jaredvideeo",
                                  locale: "en",
                                  currency: "USD",
                                  environment: .test)
        let videeoUser = VideeoUser(firstName: "Jared",
                                    lastName: "Green",
                                    profileURL: "https://picsum.photos/200",
                                    facebookId: "123",
                                    instagramId: "456",
                                    tiktokId: "789")
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

    @IBAction func showReplays(_ sender: Any) {
        showReplays()
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

    private func showReplays() {
        //TODO: How do we handle replays now that the Videeo SDK does not include any replay UI?
    }

}

extension ViewController: VideeoStreamDelegate {
    func productTapped(product: VideeoProduct, presenter: ProductPresenter) {}

    func cartTapped(presenter: CartPresenter) {}

    func close() {
        dismiss(animated: true)
    }

    func userAuthenticationRequired() {}

    func streamEnded() -> Bool {
        return false
    }

    func userRemovedFromLive() -> Bool {
        return false
    }
}

