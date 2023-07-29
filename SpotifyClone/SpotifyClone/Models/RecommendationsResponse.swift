//
//  RecommendationsResponse.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/29.
//

import Foundation

struct RecommendationResponse: Codable {
    let tracks: [AudioTrack]
}

/*
 {
     seeds =     (
                 {
             afterFilteringSize = 251;
             afterRelinkingSize = 251;
             href = "<null>";
             id = mpb;
             initialPoolSize = 266;
             type = GENRE;
         },
                 {
             afterFilteringSize = 251;
             afterRelinkingSize = 251;
             href = "<null>";
             id = country;
             initialPoolSize = 999;
             type = GENRE;
         },
                 {
             afterFilteringSize = 100;
             afterRelinkingSize = 100;
             href = "<null>";
             id = club;
             initialPoolSize = 100;
             type = GENRE;
         },
                 {
             afterFilteringSize = 251;
             afterRelinkingSize = 251;
             href = "<null>";
             id = study;
             initialPoolSize = 1000;
             type = GENRE;
         },
                 {
             afterFilteringSize = 251;
             afterRelinkingSize = 251;
             href = "<null>";
             id = "road-trip";
             initialPoolSize = 1000;
             type = GENRE;
         }
     );
     tracks =     (
                 {
             album =             {
                 "album_type" = ALBUM;
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/3GBPw9NK25X1Wt2OUvOwY3";
                         };
                         href = "https://api.spotify.com/v1/artists/3GBPw9NK25X1Wt2OUvOwY3";
                         id = 3GBPw9NK25X1Wt2OUvOwY3;
                         name = "Jack Johnson";
                         type = artist;
                         uri = "spotify:artist:3GBPw9NK25X1Wt2OUvOwY3";
                     }
                 );
                 "available_markets" =                 (
                     CA,
                     CR,
                     DO,
                     GT,
                     HN,
                     JP,
                     MX,
                     NI,
                     PA,
                     SV,
                     US
                 );
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/album/7tTc46dNdE6GGuiQsssWxo";
                 };
                 href = "https://api.spotify.com/v1/albums/7tTc46dNdE6GGuiQsssWxo";
                 id = 7tTc46dNdE6GGuiQsssWxo;
                 images =                 (
                                         {
                         height = 640;
                         url = "https://i.scdn.co/image/ab67616d0000b27306b42768ebe736eec21336ea";
                         width = 640;
                     },
                                         {
                         height = 300;
                         url = "https://i.scdn.co/image/ab67616d00001e0206b42768ebe736eec21336ea";
                         width = 300;
                     },
                                         {
                         height = 64;
                         url = "https://i.scdn.co/image/ab67616d0000485106b42768ebe736eec21336ea";
                         width = 64;
                     }
                 );
                 name = "In Between Dreams";
                 "release_date" = "2005-01-01";
                 "release_date_precision" = day;
                 "total_tracks" = 14;
                 type = album;
                 uri = "spotify:album:7tTc46dNdE6GGuiQsssWxo";
             };
             artists =             (
                                 {
                     "external_urls" =                     {
                         spotify = "https://open.spotify.com/artist/3GBPw9NK25X1Wt2OUvOwY3";
                     };
                     href = "https://api.spotify.com/v1/artists/3GBPw9NK25X1Wt2OUvOwY3";
                     id = 3GBPw9NK25X1Wt2OUvOwY3;
                     name = "Jack Johnson";
                     type = artist;
                     uri = "spotify:artist:3GBPw9NK25X1Wt2OUvOwY3";
                 }
             );
             "available_markets" =             (
                 CA,
                 CR,
                 DO,
                 GT,
                 HN,
                 JP,
                 MX,
                 NI,
                 PA,
                 SV,
                 US
             );
             "disc_number" = 1;
             "duration_ms" = 191906;
             explicit = 0;
             "external_ids" =             {
                 isrc = USMC60400032;
             };
             "external_urls" =             {
                 spotify = "https://open.spotify.com/track/451GvHwY99NKV4zdKPRWmv";
             };
             href = "https://api.spotify.com/v1/tracks/451GvHwY99NKV4zdKPRWmv";
             id = 451GvHwY99NKV4zdKPRWmv;
             "is_local" = 0;
             name = "Banana Pancakes";
             popularity = 74;
             "preview_url" = "<null>";
             "track_number" = 3;
             type = track;
             uri = "spotify:track:451GvHwY99NKV4zdKPRWmv";
         },
                 {
             album =             {
                 "album_type" = SINGLE;
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/6xvpfMjWTougrRRtK7iikz";
                         };
                         href = "https://api.spotify.com/v1/artists/6xvpfMjWTougrRRtK7iikz";
                         id = 6xvpfMjWTougrRRtK7iikz;
                         name = "Mason Ramsey";
                         type = artist;
                         uri = "spotify:artist:6xvpfMjWTougrRRtK7iikz";
                     }
                 );
                 "available_markets" =                 (
                     AD,
                     AE,
                     AG,
                     AL,
                     AM,
                     AO,
                     AR,
                     AT,
                     AU,
                     AZ,
                     BA,
                     BB,
                     BD,
                     BE,
                     BF,
                     BG,
                     BH,
                     BI,
                     BJ,
                     BN,
                     BO,
                     BR,
                     BS,
                     BT,
                     BW,
                     BY,
                     BZ,
                     CA,
                     CD,
                     CG,
                     CH,
                     CI,
                     CL,
                     CM,
                     CO,
                     CR,
                     CV,
                     CW,
                     CY,
                     CZ,
                     DE,
                     DJ,
                     DK,
                     DM,
                     DO,
                     DZ,
                     EC,
                     EE,
                     EG,
                     ES,
                     ET,
                     FI,
                     FJ,
                     FM,
                     FR,
                     GA,
                     GB,
                     GD,
                     GE,
                     GH,
                     GM,
                     GN,
                     GQ,
                     GR,
                     GT,
                     GW,
                     GY,
                     HK,
                     HN,
                     HR,
                     HT,
                     HU,
                     ID,
                     IE,
                     IL,
                     IN,
                     IQ,
                     IS,
                     IT,
                     JM,
                     JO,
                     JP,
                     KE,
                     KG,
                     KH,
                     KI,
                     KM,
                     KN,
                     KR,
                     KW,
                     KZ,
                     LA,
                     LB,
                     LC,
                     LI,
                     LK,
                     LR,
                     LS,
                     LT,
                     LU,
                     LV,
                     LY,
                     MA,
                     MC,
                     MD,
                     ME,
                     MG,
                     MH,
                     MK,
                     ML,
                     MN,
                     MO,
                     MR,
                     MT,
                     MU,
                     MV,
                     MW,
                     MX,
                     MY,
                     MZ,
                     NA,
                     NE,
                     NG,
                     NI,
                     NL,
                     NO,
                     NP,
                     NR,
                     NZ,
                     OM,
                     PA,
                     PE,
                     PG,
                     PH,
                     PK,
                     PL,
                     PS,
                     PT,
                     PW,
                     PY,
                     QA,
                     RO,
                     RS,
                     RW,
                     SA,
                     SB,
                     SC,
                     SE,
                     SG,
                     SI,
                     SK,
                     SL,
                     SM,
                     SN,
                     SR,
                     ST,
                     SV,
                     SZ,
                     TD,
                     TG,
                     TH,
                     TJ,
                     TL,
                     TN,
                     TO,
                     TR,
                     TT,
                     TV,
                     TW,
                     TZ,
                     UA,
                     UG,
                     UY,
                     UZ,
                     VC,
                     VE,
                     VN,
                     VU,
                     WS,
                     XK,
                     ZA,
                     ZM,
                     ZW
                 );
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/album/7rxL9Pb48sXuFODVaL0RHA";
                 };
                 href = "https://api.spotify.com/v1/albums/7rxL9Pb48sXuFODVaL0RHA";
                 id = 7rxL9Pb48sXuFODVaL0RHA;
                 images =                 (
                                         {
                         height = 640;
                         url = "https://i.scdn.co/image/ab67616d0000b273a5d4979cc3978d522d50ea50";
                         width = 640;
                     },
                                         {
                         height = 300;
                         url = "https://i.scdn.co/image/ab67616d00001e02a5d4979cc3978d522d50ea50";
                         width = 300;
                     },
                                         {
                         height = 64;
                         url = "https://i.scdn.co/image/ab67616d00004851a5d4979cc3978d522d50ea50";
                         width = 64;
                     }
                 );
                 name = Famous;
                 "release_date" = "2018-04-27";
                 "release_date_precision" = day;
                 "total_tracks" = 1;
                 type = album;
                 uri = "spotify:album:7rxL9Pb48sXuFODVaL0RHA";
             };
             artists =             (
                                 {
                     "external_urls" =                     {
                         spotify = "https://open.spotify.com/artist/6xvpfMjWTougrRRtK7iikz";
                     };
                     href = "https://api.spotify.com/v1/artists/6xvpfMjWTougrRRtK7iikz";
                     id = 6xvpfMjWTougrRRtK7iikz;
                     name = "Mason Ramsey";
                     type = artist;
                     uri = "spotify:artist:6xvpfMjWTougrRRtK7iikz";
                 }
             );
             "available_markets" =             (
                 AR,
                 AU,
                 AT,
                 BE,
                 BO,
                 BR,
                 BG,
                 CA,
                 CL,
                 CO,
                 CR,
                 CY,
                 CZ,
                 DK,
                 DO,
                 DE,
                 EC,
                 EE,
                 SV,
                 FI,
                 FR,
                 GR,
                 GT,
                 HN,
                 HK,
                 HU,
                 IS,
                 IE,
                 IT,
                 LV,
                 LT,
                 LU,
                 MY,
                 MT,
                 MX,
                 NL,
                 NZ,
                 NI,
                 NO,
                 PA,
                 PY,
                 PE,
                 PH,
                 PL,
                 PT,
                 SG,
                 SK,
                 ES,
                 SE,
                 CH,
                 TW,
                 TR,
                 UY,
                 GB,
                 AD,
                 LI,
                 MC,
                 ID,
                 JP,
                 TH,
                 VN,
                 RO,
                 IL,
                 ZA,
                 SA,
                 AE,
                 BH,
                 QA,
                 OM,
                 KW,
                 EG,
                 MA,
                 DZ,
                 TN,
                 LB,
                 JO,
                 PS,
                 IN,
                 BY,
                 KZ,
                 MD,
                 UA,
                 AL,
                 BA,
                 HR,
                 ME,
                 MK,
                 RS,
                 SI,
                 KR,
                 BD,
                 PK,
                 LK,
                 GH,
                 KE,
                 NG,
                 TZ,
                 UG,
                 AG,
                 AM,
                 BS,
                 BB,
                 BZ,
                 BT,
                 BW,
                 BF,
                 CV,
                 CW,
                 DM,
                 FJ,
                 GM,
                 GE,
                 GD,
                 GW,
                 GY,
                 HT,
                 JM,
                 KI,
                 LS,
                 LR,
                 MW,
                 MV,
                 ML,
                 MH,
                 FM,
                 NA,
                 NR,
                 NE,
                 PW,
                 PG,
                 WS,
                 SM,
                 ST,
                 SN,
                 SC,
                 SL,
                 SB,
                 KN,
                 LC,
                 VC,
                 SR,
                 TL,
                 TO,
                 TT,
                 TV,
                 VU,
                 AZ,
                 BN,
                 BI,
                 KH,
                 CM,
                 TD,
                 KM,
                 GQ,
                 SZ,
                 GA,
                 GN,
                 KG,
                 LA,
                 MO,
                 MR,
                 MN,
                 NP,
                 RW,
                 TG,
                 UZ,
                 ZW,
                 BJ,
                 MG,
                 MU,
                 MZ,
                 AO,
                 CI,
                 DJ,
                 ZM,
                 CD,
                 CG,
                 IQ,
                 LY,
                 TJ,
                 VE,
                 ET,
                 XK
             );
             "disc_number" = 1;
             "duration_ms" = 192520;
             explicit = 0;
             "external_ids" =             {
                 isrc = USAT21802034;
             };
             "external_urls" =             {
                 spotify = "https://open.spotify.com/track/2HGymMoOdB4ZYv0AAqYmgF";
             };
             href = "https://api.spotify.com/v1/tracks/2HGymMoOdB4ZYv0AAqYmgF";
             id = 2HGymMoOdB4ZYv0AAqYmgF;
             "is_local" = 0;
             name = Famous;
             popularity = 43;
             "preview_url" = "https://p.scdn.co/mp3-preview/a942b08b99078279f04d3a805b5718ba5242e79e?cid=d01a7d13ace645cb85fa73d68c200a8f";
             "track_number" = 1;
             type = track;
             uri = "spotify:track:2HGymMoOdB4ZYv0AAqYmgF";
         }
     );
 }

 */
