//
//  ContentViewModel.swift
//  Demo
//
//  Created by Jared Green on 1/25/23.
//

import VideeoSDK
import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var showLiveStream = false
}

extension ContentViewModel: VideeoStreamDelegate {
    func productTapped(product: VideeoProduct) -> UIViewController? {
        return nil
    }

    func close() {
        showLiveStream = false
    }

    func userAuthenticationRequired() {}

    func streamEnded() -> Bool {
        return false
    }

    func userRemovedFromLive() -> Bool {
        return false
    }
}
