//
//  AuthManager.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/20.
//

import Foundation


final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    struct Constants {
        static let clientID = ProcessInfo.processInfo.environment["spotify_client_id"]!
        static let clientSecret = ProcessInfo.processInfo.environment["spotify_client_secret"]!
    }
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://velog.io/@peppermint100"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scopes=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }

    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
