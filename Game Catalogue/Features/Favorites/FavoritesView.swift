//
//  FavoritesView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 23/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject private var gameListState = GamesState()
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0.0) {
                Spacer(minLength: 16)
                GameListView(games: self.gameListState.gameFavorites, errorMessage: "No favorite game")
            }
            .onAppear {
                if self.gameListState.games2Array == nil {
                self.gameListState.getGameFavorites()
                }
            }
        }
        .navigationBarTitle("Favorite", displayMode: .inline)
        .navigationBarHidden(false)
        .buttonStyle(PlainButtonStyle())
        .navigationBarColor(UIColor.transparant)
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
