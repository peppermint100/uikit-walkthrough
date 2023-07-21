//
//  AuthResponse.swift
//  SpotifyClone
//
//  Created by 이인규 on 2023/07/21.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let token_type: String
}
