//
//  GameListState.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 28/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI
import RxSwift
import Combine

class GamesState: ObservableObject {
    @Published var games: [Game]?
    @Published var games2Array: [[Game]]?
    @Published var gameFavorites: [[Game]]?
    @Published var game: GameDetail?
    @Published var searchValue: String = ""
    @Published var isFavorite: Bool = false
    
    private var cancellable: AnyCancellable?
    private let gameService: GameService
    private let gameDbProvider: GameDBProvider
    private let disposable: DisposeBag = DisposeBag()
    
    init(gameSevice: GameService = GameService.shared, gameDbProvider: GameDBProvider = GameDBProvider.shared) {
        self.gameService = gameSevice
        self.gameDbProvider = gameDbProvider
    }
    
    func setupDebouceSearchGames() {
      if cancellable == nil {
        cancellable = AnyCancellable($searchValue.removeDuplicates()
            .debounce(for: 1.0, scheduler: DispatchQueue.main)
            .sink { searchText in
                if searchText != "" {
                    print(searchText)
                    self.searchGames(query: searchText)
                }
        })
      }
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
                    print(self.games2Array ?? "")
                case .error(let error):
                    print(error)
                }
        }.disposed(by: disposable)
    }
    
    func loadGame(id: Int) {
        getGameFavorite(id: id)
        self.game = nil
        gameService.getGame(id: id)
            .subscribe { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.game = data
                case .error(let error):
                    print(error)
                }
        }.disposed(by: disposable)
    }
    
    func searchGames(query: String) {
        self.games = nil
        self.games2Array = nil
        gameService.searchGames(query: query)
            .subscribe { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.games = data.results
                    self.games2Array = self.convertArrayToArrays(games: data.results)
                    print(self.games2Array ?? "")
                case .error(let error):
                    self.games2Array = []
                    print(error)
                }
        }.disposed(by: disposable)
    }
    
    func convertArrayToArrays(games: [Game]) -> [[Game]] {
        var index = 0
        var arrays: [[Game]] = []
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
        if !game1.isEmpty || !game2.isEmpty {
            arrays = [game1, game2]
        }
        return arrays
    }
    
    func getGameFavorite(id: Int) {
        gameDbProvider.isGameFovorite(id: id) { (isFavorite) in
            self.isFavorite = isFavorite
        }
    }
    
    func getGameFavorites() {
        gameDbProvider.getAllGameFromLocal { (games) in
            if games.isEmpty {
                self.gameFavorites = []
            } else {
                self.gameFavorites = self.convertArrayToArrays(games: games)
            }
        }
    }
    
    func saveOrDeleteGame() {
        if let game = game {
            if !isFavorite {
                gameDbProvider.saveGame(game: game) { (isSave) in
                    if isSave { self.isFavorite = true }
                }
            } else {
                gameDbProvider.deleteGameFromLocal(id: game.id) { (isDelete) in
                    if isDelete { self.isFavorite = false }
                }
            }
        }
    }
}
