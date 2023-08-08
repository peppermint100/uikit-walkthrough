//
//  FeaturedPlaylistsResponse.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/29.
//

import Foundation

struct FeaturedPlaylistsResponse: Codable {
    let playlists: PlaylistResponse
}

struct CategoryPlaylistsResponse: Codable {
    let playlists: PlaylistResponse
}

struct PlaylistResponse: Codable {
    let items: [Playlist]
}


struct User: Codable {
    let display_name: String
    let external_urls: [String: String]
    let id: String
}
/*
 {
     message = "\Uc778\Uae30\Uac00\Uc694 & \Uc2e0\Uace1";
     playlists =     {
         href = "https://api.spotify.com/v1/browse/featured-playlists?country=KR&timestamp=2023-07-29T07%3A24%3A58&offset=0&limit=2";
         items =         (
                         {
                 collaborative = 0;
                 description = "\Uc9c0\Uae08 \Uad6d\Ub0b4\Uc5d0\Uc11c \Uac00\Uc7a5 \Ud56b\Ud55c \Ub178\Ub798\Ub4e4\Uc744 \Ub9cc\Ub098\Ubcf4\Uc138\Uc694! (\Ucee4\Ubc84: (\Uc5ec\Uc790)\Uc544\Uc774\Ub4e4)";
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/playlist/37i9dQZF1DX0sa2Fqej3CR";
                 };
                 href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX0sa2Fqej3CR";
                 id = 37i9dQZF1DX0sa2Fqej3CR;
                 images =                 (
                                         {
                         height = "<null>";
                         url = "https://i.scdn.co/image/ab67706f00000003e564f4adf2d89df9eb5b15c5";
                         width = "<null>";
                     }
                 );
                 name = "\Uc778\Uae30\Uac00\Uc694 Hot Now";
                 owner =                 {
                     "display_name" = Spotify;
                     "external_urls" =                     {
                         spotify = "https://open.spotify.com/user/spotify";
                     };
                     href = "https://api.spotify.com/v1/users/spotify";
                     id = spotify;
                     type = user;
                     uri = "spotify:user:spotify";
                 };
                 "primary_color" = "<null>";
                 public = "<null>";
                 "snapshot_id" = MTY4OTkxMzM2NCwwMDAwMDAwMGQ1NTIxODNiMWRmNGZjMDVkZTVjM2EwN2VjMTc5YjZk;
                 tracks =                 {
                     href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX0sa2Fqej3CR/tracks";
                     total = 53;
                 };
                 type = playlist;
                 uri = "spotify:playlist:37i9dQZF1DX0sa2Fqej3CR";
             },
                         {
                 collaborative = 0;
                 description = "\Uad6d\Ub0b4\Uc678 \Uac00\Uc7a5 \Ud56b\Ud55c \Ub178\Ub798\Ub4e4\Uc744 \Ub9cc\Ub098\Ubcf4\Uc138\Uc694! (\Ucee4\Ubc84: NewJeans)";
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/playlist/37i9dQZF1DWT9uTRZAYj0c";
                 };
                 href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWT9uTRZAYj0c";
                 id = 37i9dQZF1DWT9uTRZAYj0c;
                 images =                 (
                                         {
                         height = "<null>";
                         url = "https://i.scdn.co/image/ab67706f0000000393d12c58b90b891b422a6e49";
                         width = "<null>";
                     }
                 );
                 name = "Hot Hits Korea";
                 owner =                 {
                     "display_name" = Spotify;
                     "external_urls" =                     {
                         spotify = "https://open.spotify.com/user/spotify";
                     };
                     href = "https://api.spotify.com/v1/users/spotify";
                     id = spotify;
                     type = user;
                     uri = "spotify:user:spotify";
                 };
                 "primary_color" = "<null>";
                 public = "<null>";
                 "snapshot_id" = MTY4OTkxMzM0MywwMDAwMDAwMDk3MGY2ZTcxMTJjMmQxODM3YTg4Y2Q0M2JhY2E3MTIz;
                 tracks =                 {
                     href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWT9uTRZAYj0c/tracks";
                     total = 56;
                 };
                 type = playlist;
                 uri = "spotify:playlist:37i9dQZF1DWT9uTRZAYj0c";
             }
         );
         limit = 2;
         next = "https://api.spotify.com/v1/browse/featured-playlists?country=KR&timestamp=2023-07-29T07%3A24%3A58&offset=2&limit=2";
         offset = 0;
         previous = "<null>";
         total = 9;
     };
 }

 */
