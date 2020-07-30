//
//  Games.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 28/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation

struct GamesResponse: Codable {
    let count: Int
    let results: [Game]
    
}

struct Game: Codable, Identifiable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Double
    let added: Int
    let platforms: [Platforms]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case added
        case platforms = "parent_platforms"
    }
}

struct Platforms: Codable {
    let platform: Platform
}

struct Platform: Codable {
    let id: Int
    let name: String
    let slug: String
}
