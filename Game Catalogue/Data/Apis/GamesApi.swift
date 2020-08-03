//
//  GameApi.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 28/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation
import Moya

enum GamesApi {
    case getGames(_ platforms: String)
    case getGame(_ id: Int)
    case searchGames(_ query: String)
}

extension GamesApi: BaseApi {
    
    var path: String {
        switch self {
        case .getGames, .searchGames:
            return "/games"
        case .getGame(let id):
            return "/games/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case.getGames, .getGame, .searchGames:
            return .get
        }
    }
    
    var task: Task {
        var param: [String: Any] = [:]
        switch self {
        case .getGames(let platforms):
            param["parent_platforms"] = platforms
        case .getGame :
            return .requestPlain
        case .searchGames(let query):
            param["search"] = query
        }
        return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
    }
}
