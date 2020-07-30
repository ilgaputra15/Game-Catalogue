//
//  GameRow.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 26/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct GameList: View {
    var games: [[Game]]?
    var body: some View {
        HStack {
            if games != nil {
                ForEach(0 ..< games!.count) {index in
                    VStack {
                        ForEach(self.games![index]) {game in
                            if index == 0 {
                                GameCard(game: game)
                                    .padding(.trailing, 8.0)
                                    .padding(.leading, 0.0)
                            } else if index == self.games!.count {
                                GameCard(game: game)
                                .padding(.trailing, 0.0)
                                .padding(.leading, 8.0)
                            } else {
                                GameCard(game: game)
                            }
                            Spacer(minLength: 24.0)
                        }
                        Spacer()
                    }
                }
            } else {
                GameListEmpty()
                    .padding(.trailing, 8.0)
                GameListEmpty()
                    .padding(.leading, 8.0)
                
            }
        }.padding(.horizontal, 24.0)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct GameListEmpty: View {
    var body: some View {
        VStack {
            ForEach(0..<10) {_ in
                ZStack {
                    Rectangle()
                        .fill(Color.greyishBrown)
                        .cornerRadius(8)
                        .frame(height: 236.0)
                    Spacer(minLength: 24.0)
                    ActivityIndicatorView()
                }
            }
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameList(games: [[Game.stubbedGames[1], Game.stubbedGames[1]], [Game.stubbedGames[2]]])
    }
}
