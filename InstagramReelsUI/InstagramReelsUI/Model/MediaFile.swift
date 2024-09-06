//
//  MediaFile.swift
//  InstagramReelsUI
//
//  Created by Oleksandr Isaiev on 06.09.2024.
//

import SwiftUI

struct MediaFile: Identifiable {
    let id = UUID().uuidString
    let url: String
    let title: String
    let isExpanded: Bool = false
}

extension MediaFile {
    static let mediaMocks: [MediaFile] = [
        .init(url: "bronco_1", title: "Bronco is..."),
        .init(url: "bronco_2", title: "It is awesome!"),
        .init(url: "jeep_01", title: "Just a jeep"),
        .init(url: "jeep_02", title: "Wait for it..."),
        .init(url: "jeep_03", title: "Haha"),
        .init(url: "mario_01", title: "You can't believe!")
    ]
}
