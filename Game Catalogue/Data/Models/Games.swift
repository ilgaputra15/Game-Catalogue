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
    let released: String?
    let backgroundImage: String?
    let rating: Double?
    let added: Int?
    let platforms: [Platforms]?
    var releasedDate: String {
      if released != nil {
        return (released?.convertDateFormat(from: "yyyy-mm-dd", to: "MMM d, yyyy"))!
      } else {
        return "-"
      }
    }
    
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
    var imageResName: String? {
        switch id {
        case 1:
            return "Windows"
        case 2:
            return "PlayStation"
        case 3:
            return "X-Box"
        default:
            return nil
        }
    }
}

struct GameDetail: Codable, Identifiable {
    let id: Int
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Double?
    let added: Int?
    let platforms: [Platforms]?
    let genres: [Genre]?
    let developers: [Developer]?
    let publishers: [Publisher]?
    let descriptionRaw: String
    let website: String
    var releasedDate: String {
      if released != nil {
        return (released?.convertDateFormat(from: "yyyy-mm-dd", to: "MMM d, yyyy"))!
      } else {
        return "-"
      }
    }
    
    var developerString: String {
      if let developers = developers {
        return developers.map { developer in developer.name }.joined(separator: ", ")
      } else {
        return "-"
      }
    }
    
    var genreString: String {
      if let genres = genres {
        return genres.map { genre in genre.name }.joined(separator: ", ")
      } else {
        return "-"
      }
    }
    
    var publisherString: String {
      if let publishers = publishers {
        return publishers.map { publisher in publisher.name }.joined(separator: ", ")
      } else {
        return "-"
      }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case added
        case platforms = "parent_platforms"
        case genres
        case developers
        case publishers
        case descriptionRaw = "description_raw"
        case website
    }
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
}

struct Developer: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
}

struct Publisher: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
}
