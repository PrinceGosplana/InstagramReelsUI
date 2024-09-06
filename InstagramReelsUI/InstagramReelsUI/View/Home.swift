//
//  Home.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 06.09.2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                Text("Home")
                    .tag("house.fill")

                Text("Search")
                    .tag("magnifyingglass")

                Text("Liked")
                    .tag("suit.heart")

                Text("Profile")
                    .tag("person.circle")
            }
        }
    }
}

#Preview {
    Home()
}
