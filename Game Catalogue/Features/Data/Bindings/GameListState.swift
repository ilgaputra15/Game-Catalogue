//
//  GameListState.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 28/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI
import RxSwift

class GameListState: ObservableObject {
    @Published var games: [Game]?
    @Published var games2Array: [[Game]]?
    
    private let gameService: GameService
    private let disposable: DisposeBag = DisposeBag()
    
    init(gameSevice: GameService = GameService.shared) {
        self.gameService = gameSevice
    }
    
    func loadGames(platforms: String) {
        self.games = nil
        self.games2Array = nil
        gameService.getGames(platforms: platforms)
            .subscribe { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.games = data.results
                    self.games2Array = self.convertArrayToArrays(games: data.results)
                    print(self.games2Array)
                case .error(let error):
                    print(error)
                }
        }.disposed(by: disposable)
    }
    
    func convertArrayToArrays(games: [Game]) -> [[Game]] {
        var index = 0
        var arrays: [[Game]] = [[]]
        var game1: [Game] = []
        var game2: [Game] = []
        while index < games.count {
            if index % 2 == 0 {
                game1.append(games[index])
            } else {
                game2.append(games[index])
            }
            index += 1
        }
        arrays = [game1, game2]
        return arrays
    }
}
