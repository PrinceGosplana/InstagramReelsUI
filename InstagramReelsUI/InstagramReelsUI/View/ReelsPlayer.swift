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
            VStack {
                Text("Hello")

                Spacer()

                Text("Hello")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
