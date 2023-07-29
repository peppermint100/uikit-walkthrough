//
//  NewReleasesResponse.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/29.
//

import Foundation


struct NewReleasesResponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}

struct Album: Codable {
    let album_type: String
    let id: String
    let images: [APIImage]
    let name: String
    let release_date: String
    let total_tracks: Int
    let artists: [Artist]
}
