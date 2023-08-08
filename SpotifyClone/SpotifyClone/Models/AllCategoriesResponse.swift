//
//  AllCategoriesResponse.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/08/06.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
