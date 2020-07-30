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

enum Gamekeyword: String, CaseIterable {
    case all = "All Platform"
    case ps = "PlaySation"
    case xbox = "XBox"
    case pc = "PC"
}

extension Gamekeyword {
    var value: String {
        switch self {
        case .all:
            return "1,2,3"
        case .ps:
            return "2"
        case .xbox:
            return "3"
        case .pc:
            return "1"
        }
    }
}

struct Platforms: Codable, Identifiable {
    var id: Int { platform.id }
    let platform: Platform
}

struct Platform: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    let imageResName: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        slug = try container.decode(String.self, forKey: .slug)
        let id = try container.decode(Int.self, forKey: .id)
        switch id {
        case 1:
            imageResName = "Windows"
        case 2:
            imageResName = "PlayStation"
        case 3:
            imageResName = "X-Box"
        default:
            imageResName = nil
        }
    }
}
