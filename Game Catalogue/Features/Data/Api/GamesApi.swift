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
}

extension GamesApi: BaseApi {
    
    var path: String {
        switch self {
        case .getGames:
            return "/games"
        case .getGame(let id):
            return "/games/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case.getGames, .getGame:
            return .get
        }
    }
    
    var task: Task {
        var param: [String: Any] = [:]
        switch self {
        case .getGames(let platforms):
            param["parent_platforms"] = platforms
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getGame : return .requestPlain
        }
    }
}
