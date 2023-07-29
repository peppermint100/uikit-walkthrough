//
//  AudioTrac.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/20.
//

import Foundation

struct AudioTrack: Codable {
    let album: Album
    let artists: [Artist]
    let available_markets: [String]
    let disc_number: Int
    let duration_ms: Int
    let explicit: Bool
    let external_urls: [String: String]
    let id: String
    let name: String
    let popularity: Int
}
