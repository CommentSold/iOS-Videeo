//
//  DemoApp.swift
//  Demo
//
//  Created by Jared Green on 10/21/22.
//

import SwiftUI

@main
struct DemoApp: App {

    @StateObject var appEnvironment = AppEnvironment()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appEnvironment)
        }
    }
}
