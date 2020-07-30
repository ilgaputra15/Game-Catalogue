//
//  Games+Stub.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 30/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation

extension Game {
    static var stubbedGames: [Game] {
        let response: GamesResponse? = try? Bundle.main.loadAndDecodeJson(fileName: "game_list")
        return response!.results
    }
}

extension Bundle {
    func loadAndDecodeJson<D: Codable>(fileName: String) throws -> D? {
        guard let url = self.url(forResource: fileName, withExtension: ".json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(D.self, from: data)
            return object
        } catch {
            return nil
        }
    }
}
