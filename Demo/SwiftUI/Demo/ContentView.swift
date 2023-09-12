//
//  ContentView.swift
//  Demo
//
//  Created by Jared Green on 10/21/22.
//

import SwiftUI
import VideeoSDK

struct ContentView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @ObservedObject var contentViewModel: ContentViewModel
    @State private var showReplays = false

    init(contentViewModel: ContentViewModel) {
        self.contentViewModel = contentViewModel
    }

    var body: some View {
        VStack {
            Text("Videeo Demo")
                .font(.system(.largeTitle))
            Button("Show Live") {
                contentViewModel.showLiveStream = true
            }
            .padding()
            Button("Show Replays") {
                showReplays = true
            }
            .padding()
        }
            .alert("Watch live stream?", isPresented: $appEnvironment.showLiveStreamAlert) {
                Button("OK") {
                    contentViewModel.showLiveStream = true
                }
                Button("Cancel", role: .cancel) {}
            }
            .fullScreenCover(isPresented: $contentViewModel.showLiveStream) {
                try? VideeoManager.instance.getLiveStreamView(delegate: contentViewModel)
                    .ignoresSafeArea()
            }
            .fullScreenCover(isPresented: $showReplays) {
                //TODO: How do we handle replays now that the Videeo SDK does not include any replay UI?
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contentViewModel: ContentViewModel())
    }
}
