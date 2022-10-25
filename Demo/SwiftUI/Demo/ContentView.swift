//
//  ContentView.swift
//  Demo
//
//  Created by Jared Green on 10/21/22.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var appEnvironment: AppEnvironment
    @State var showLiveStream = false

    var body: some View {
        VStack {
            Text("Videeo Demo")
                .font(.system(.largeTitle))
            Button("Show Live") {
                showLiveStream = true
            }
            .padding()
        }
            .alert("Watch live stream?", isPresented: $appEnvironment.showLiveStreamAlert) {
                Button("OK") {
                    showLiveStream = true
                }
                Button("Cancel", role: .cancel) {}

            }
            .fullScreenCover(isPresented: $showLiveStream) {
                VideeoView(videeoDelegate: appEnvironment)
                    .ignoresSafeArea()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
