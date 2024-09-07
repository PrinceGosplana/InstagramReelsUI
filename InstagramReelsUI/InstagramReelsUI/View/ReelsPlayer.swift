//
//  ReelsPlayer.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 06.09.2024.
//

import SwiftUI

struct ReelsPlayer: View {

    @Binding var reel: Reel
    /// Expanding title if its clicked
    @State private var showMore = false
    @State private var isMuted = false
    @State private var volumeAnimation = false

    private let sampleText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."

    var body: some View {
        ZStack {
            if let player = reel.player {
                CustomVideoPlayer(player: player)

                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .global).minY
                    let size = proxy.size

                    DispatchQueue.main.async {
                        -minY < (size.height / 2) && minY < (size.height / 2) ? player.play() : player.pause()
                    }
                    return .clear
                }

                /// Volume control
                Color.black
                    .opacity(0.01)
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        if volumeAnimation { return }
                        isMuted.toggle()

                        player.isMuted = isMuted
                        withAnimation {
                            volumeAnimation.toggle()
                        }

                        /// Closing animation after 0.8 sec
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation {
                                volumeAnimation.toggle()
                            }
                        }
                    }

                /// Dimming background when showing more content
                Color.black.opacity(showMore ? 0.35 : 0)
                    .onTapGesture {
                        withAnimation {
                            showMore.toggle()
                        }
                    }
                VStack {
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 15) {
                                Image(.profilePicture)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())

                                Text("Juventus")
                                    .font(.callout.bold())

                                Button {
                                    
                                } label: {
                                    Text("Follow")
                                        .font(.caption.bold())
                                }
                            }

                            /// title custom view
                            ZStack {
                                if showMore {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        /// extra text
                                        Text(reel.mediaFile.title + sampleText)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                    }
                                    .frame(height: 120)
                                    .onTapGesture {
                                        withAnimation {
                                            showMore.toggle()
                                        }
                                    }
                                } else {
                                    Button {
                                        withAnimation {
                                            showMore.toggle()
                                        }
                                    } label: {
                                        HStack {
                                            Text(reel.mediaFile.title)
                                                .font(.callout)
                                                .fontWeight(.semibold)
                                                .lineLimit(1)

                                            Text("more")
                                                .font(.callout.bold())
                                                .foregroundStyle(.gray)
                                        }
                                        .padding(.top, 6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                            }
                        }

                        Spacer(minLength: 20)

                        ActionButtons(reel: reel)
                    }

                    /// Music view
                    HStack {
                        Text("A Sky full of Start")
                            .font(.caption)
                            .fontWeight(.semibold)

                        Spacer(minLength: 20)

                        Image(.animeGilRedHair)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .background {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.white, lineWidth: 3)
                            }
                            .offset(x: -5)
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .foregroundStyle(.white)
                .frame(maxHeight: .infinity, alignment: .bottom)

                Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.secondary)
                    .clipShape(Circle())
                    .foregroundStyle(.black)
                    .opacity( volumeAnimation ? 1 : 0 )
            }
        }
    }
}

#Preview {
    ContentView()
}
