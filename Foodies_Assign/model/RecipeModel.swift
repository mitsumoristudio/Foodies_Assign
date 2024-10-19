//
//  RecipeModel.swift
//  Foodies_Assign
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import Foundation

struct RecipeModel: Decodable, Identifiable {
    var id: Int?
    var recipes: [Recipe]
}

struct Recipe: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case photourllarge = "photo_url_large"
        case photourlsmall = "photo_url_small"
        case sourceurl = "source_url"
        case youtubeurl = "youtube_url"
        case cuisine = "cuisine"
        case name = "name"
        case uuid = "uuid"
        case id = "id"
    }
    
    let cuisine: String
    let name: String
    let uuid: String?
    let photourllarge: String?
    let photourlsmall: String?
    let sourceurl: String?
    let youtubeurl: String?
    let id: Int?
  
}
