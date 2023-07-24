//
//  UserProfile.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/20.
//

import Foundation

struct UserProfile {
    let display_name: String
    let external_urls: [String: String]
    let followers: [String: Codable?]
    let id: String
    let images: [UserImage]
}

struct UserImage: Codable {
    let url: String
}
