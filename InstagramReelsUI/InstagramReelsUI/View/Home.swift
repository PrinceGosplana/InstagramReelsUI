//
//  Home.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 06.09.2024.
//

import SwiftUI

struct Home: View {

    private let images = ["house.fill", "magnifyingglass", "reels", "suit.heart", "person.circle"]
    @State private var currentTab = "Reels"

    /// Hiding tabbar
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("Home")
                    .tag("house.fill")

                Text("Search")
                    .tag("magnifyingglass")

                ReelsView()
                    .tag("reels")

                Text("Liked")
                    .tag("suit.heart")

                Text("Profile")
                    .tag("person.circle")
            }

            HStack(spacing: 0) {
                ForEach(images, id: \.self) {
                    TabBarButton(image: $0, isSystemImage: $0 != "reels", currentTab: $currentTab)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .overlay(Divider(), alignment: .top)
            .background(currentTab == "reels" ? .black : .clear)
        }
    }
}

#Preview {
    Home()
}
