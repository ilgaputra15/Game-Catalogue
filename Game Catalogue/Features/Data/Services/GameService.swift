//
//  GameService.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 28/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class GameService {
    
    static let shared = GameService()
    
    private var provider = MoyaProvider<GamesApi>()
    
    init() {}
    
    func getGames(platforms: String) -> Single<GamesResponse> {
        return provider.rx.request(.getGames(platforms), GamesResponse.self)
    }
}
