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
}

extension GamesApi: BaseApi {
    
    var path: String {
        switch self {
        case .getGames:
            return "/games"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case.getGames:
            return .get
        }
    }
    
    var task: Task {
        var param: [String: Any] = [:]
        switch self {
        case .getGames(let platforms):
            param["parent_platforms"] = platforms
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
}
