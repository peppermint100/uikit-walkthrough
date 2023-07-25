//
//  SettingsModels.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/25.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
