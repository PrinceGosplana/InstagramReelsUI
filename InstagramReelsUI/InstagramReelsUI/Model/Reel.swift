//
//  Reel.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 06.09.2024.
//

import AVKit
import SwiftUI

struct Reel: Identifiable {
    let id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile
}
