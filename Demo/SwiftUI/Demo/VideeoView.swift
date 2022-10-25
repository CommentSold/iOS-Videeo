//
//  VideeoView.swift
//  Demo
//
//  Created by Jared Green on 10/21/22.
//

import Foundation
import SwiftUI
import VideeoSDK

struct VideeoView: UIViewControllerRepresentable {

    var videeoDelegate: VideeoSDK.VideeoStreamDelegate?

    func makeUIViewController(context: Context) -> UIViewController {
        return VideeoManager.instance.getLiveStreamViewController(delegate: videeoDelegate) ?? UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
}
