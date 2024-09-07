//
//  ActionButtons.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 07.09.2024.
//

import SwiftUI

struct ActionButtons: View {

    let reel: Reel

    var body: some View {
        VStack(spacing: 25) {
            Button {

            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "suit.heart")
                        .font(.title)

                    Text("233K")
                        .font(.caption.bold())
                }
            }

            Button {

            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "bubble.right")
                        .font(.title)

                    Text("120")
                        .font(.caption.bold())
                }
            }

            Button {

            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "paperplane")
                        .font(.title)
                }
            }

            Button {

            } label: {
                Image(systemName: "ellipsis")
                    .frame(width: 20, height: 20)
            }
        }
    }
}
