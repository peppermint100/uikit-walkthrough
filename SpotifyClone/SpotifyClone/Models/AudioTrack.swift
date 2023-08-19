//
//  AudioTrac.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/20.
//

import Foundation

struct AudioTrack: Codable {
    let album: Album?
    let artists: [Artist]
    let disc_number: Int
    let duration_ms: Int
    let explicit: Bool
    let external_urls: [String: String]
    let id: String
    let name: String
    let preview_url: String?
}

/*
 {
     "album_type" = single;
     artists =     (
                 {
             "external_urls" =             {
                 spotify = "https://open.spotify.com/artist/3wcj11K77LjEY1PkEazffa";
             };
             href = "https://api.spotify.com/v1/artists/3wcj11K77LjEY1PkEazffa";
             id = 3wcj11K77LjEY1PkEazffa;
             name = "Burna Boy";
             type = artist;
             uri = "spotify:artist:3wcj11K77LjEY1PkEazffa";
         }
     );
     copyrights =     (
                 {
             text = "Spaceship Records, Bad Habit, \U00a9 2023 Atlantic Recording Corporation";
             type = C;
         },
                 {
             text = "Spaceship Records, Bad Habit, \U2117 2023 Atlantic Recording Corporation";
             type = P;
         }
     );
     "external_ids" =     {
         upc = 075679679109;
     };
     "external_urls" =     {
         spotify = "https://open.spotify.com/album/75AHV3X6Pcy1aHJZabAwib";
     };
     genres =     (
     );
     href = "https://api.spotify.com/v1/albums/75AHV3X6Pcy1aHJZabAwib";
     id = 75AHV3X6Pcy1aHJZabAwib;
     images =     (
                 {
             height = 640;
             url = "https://i.scdn.co/image/ab67616d0000b273462b338fc02442f938ec93d7";
             width = 640;
         },
                 {
             height = 300;
             url = "https://i.scdn.co/image/ab67616d00001e02462b338fc02442f938ec93d7";
             width = 300;
         },
                 {
             height = 64;
             url = "https://i.scdn.co/image/ab67616d00004851462b338fc02442f938ec93d7";
             width = 64;
         }
     );
     "is_playable" = 1;
     label = "Spaceship/ Bad Habit/Atlantic Records";
     name = "Big 7";
     popularity = 56;
     "release_date" = "2023-07-27";
     "release_date_precision" = day;
     "total_tracks" = 2;
     tracks =     {
         href = "https://api.spotify.com/v1/albums/75AHV3X6Pcy1aHJZabAwib/tracks?offset=0&limit=50&locale=ko-KR,ko;q=0.9";
         items =         (
                         {
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/3wcj11K77LjEY1PkEazffa";
                         };
                         href = "https://api.spotify.com/v1/artists/3wcj11K77LjEY1PkEazffa";
                         id = 3wcj11K77LjEY1PkEazffa;
                         name = "Burna Boy";
                         type = artist;
                         uri = "spotify:artist:3wcj11K77LjEY1PkEazffa";
                     }
                 );
                 "disc_number" = 1;
                 "duration_ms" = 143042;
                 explicit = 1;
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/track/1OgoyOlrMJFqjE1eqQiCUc";
                 };
                 href = "https://api.spotify.com/v1/tracks/1OgoyOlrMJFqjE1eqQiCUc";
                 id = 1OgoyOlrMJFqjE1eqQiCUc;
                 "is_local" = 0;
                 "is_playable" = 0;
                 name = "Big 7";
                 "preview_url" = "<null>";
                 restrictions =                 {
                     reason = "age_verification_required";
                 };
                 "track_number" = 1;
                 type = track;
                 uri = "spotify:track:1OgoyOlrMJFqjE1eqQiCUc";
             },
                         {
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/3wcj11K77LjEY1PkEazffa";
                         };
                         href = "https://api.spotify.com/v1/artists/3wcj11K77LjEY1PkEazffa";
                         id = 3wcj11K77LjEY1PkEazffa;
                         name = "Burna Boy";
                         type = artist;
                         uri = "spotify:artist:3wcj11K77LjEY1PkEazffa";
                     }
                 );
                 "disc_number" = 1;
                 "duration_ms" = 159372;
                 explicit = 1;
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/track/4UtbYIyCHfrJU0wMsm4obN";
                 };
                 href = "https://api.spotify.com/v1/tracks/4UtbYIyCHfrJU0wMsm4obN";
                 id = 4UtbYIyCHfrJU0wMsm4obN;
                 "is_local" = 0;
                 "is_playable" = 0;
                 name = "Sittin' On Top Of The World";
                 "preview_url" = "<null>";
                 restrictions =                 {
                     reason = "age_verification_required";
                 };
                 "track_number" = 2;
                 type = track;
                 uri = "spotify:track:4UtbYIyCHfrJU0wMsm4obN";
             }
         );
         limit = 50;
         next = "<null>";
         offset = 0;
         previous = "<null>";
         total = 2;
     };
     type = album;
     uri = "spotify:album:75AHV3X6Pcy1aHJZabAwib";
 }

 */

