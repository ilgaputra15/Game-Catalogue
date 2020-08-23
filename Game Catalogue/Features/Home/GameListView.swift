//
//  GameRow.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 26/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct GameListView: View {
    var games: [[Game]]?
    var errorMessage: String = "No Results"
    var body: some View {
        VStack {
            if games != nil {
                if games!.count > 0 {
                    ScrollView {
                        HStack {
                            ForEach(0 ..< games!.count) {index in
                                VStack {
                                    ForEach(self.games![index]) {game in
                                        GameCardView(game: game)
                                            .padding(.trailing, index == 0 ? 8.0 : 0.0)
                                            .padding(.leading, index != 0 ? 8.0 : 0.0)
                                        Spacer(minLength: 24.0)
                                    }
                                    Spacer()
                                }
                            }
                            if (games![1].count == 0) && (games![0].count != games![1].count) {
                                VStack {
                                  Rectangle()
                                    .fill(Color.backgroundColor)
                                    .cornerRadius(8)
                                }
                            }
                        }.padding(.horizontal, 24.0)
                    }
                } else {
                    VStack {
                        Spacer()
                        Text(errorMessage)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white.opacity(0.7))
                        Spacer()
                    }
                }
            } else {
                ScrollView {
                    HStack {
                        GameListEmpty()
                        Spacer(minLength: 16.0)
                        GameListEmpty()
                    }.padding(.horizontal, 24.0)
                }
            }
        }
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
                    ActivityIndicatorView(style: .medium, color: .gray)
                }
                Spacer(minLength: 24.0)
            }
           
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(games: [[Game.stubbedGames[1], Game.stubbedGames[1]], [Game.stubbedGames[2]]])
    }
}
