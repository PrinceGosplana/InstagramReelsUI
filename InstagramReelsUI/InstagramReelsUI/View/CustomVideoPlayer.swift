//
//  CustomVideoPlayer.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 06.09.2024.
//

import AVKit
import SwiftUI

struct CustomVideoPlayer: UIViewControllerRepresentable {

    var player: AVPlayer

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        /// repeating playback

        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.restartPlayback), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }

    class Coordinator: NSObject {
        var parent: CustomVideoPlayer

        init(parent: CustomVideoPlayer) {
            self.parent = parent
        }

        @objc func restartPlayback() {
            parent.player.seek(to: .zero)
        }
    }
}
