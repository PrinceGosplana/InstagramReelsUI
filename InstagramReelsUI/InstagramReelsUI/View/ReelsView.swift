//
//  ReelsView.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 06.09.2024.
//

import AVKit
import SwiftUI

struct ReelsView: View {
    
    @State var currentReel = ""
    /// Extracting avplayer from media file
    @State var reels = MediaFile.mediaMocks.map { item -> Reel in
        let url = Bundle.main.path(forResource: item.url, ofType: "mp4") ?? ""
        let player = AVPlayer(url: URL(fileURLWithPath: url))
        return Reel(player: player, mediaFile: item)
    }
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            TabView(selection: $currentReel) {
                ForEach($reels) { $reel in

                    ReelsPlayer(reel: $reel, currentReel: $currentReel)
                    // setting width
                    .frame(width: size.width)
                    /// Rotating content
                    .rotationEffect(.init(degrees: -90))
                    .ignoresSafeArea(.all, edges: .top)
                    .tag(reel.id)
                }
            }
            /// Rotating View
            .rotationEffect(.init(degrees: 90))
            /// Since view is rotated setting height as width
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.ignoresSafeArea())
        /// initial reel
        .onAppear {
            currentReel = reels.first?.id ?? ""
        }
    }
}

#Preview {
    ContentView()
}
