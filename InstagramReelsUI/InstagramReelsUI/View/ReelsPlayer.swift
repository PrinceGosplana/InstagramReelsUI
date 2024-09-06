//
//  ReelsPlayer.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 06.09.2024.
//

import SwiftUI

struct ReelsPlayer: View {

    @Binding var reel: Reel

    var body: some View {
        ZStack {
            if let player = reel.player {
                CustomVideoPlayer(player: player)
            }
        }
    }
}
