//
//  Playlist.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/20.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
