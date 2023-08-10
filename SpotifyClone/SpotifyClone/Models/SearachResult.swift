//
//  SearachResult.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/08/10.
//

import Foundation


enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
