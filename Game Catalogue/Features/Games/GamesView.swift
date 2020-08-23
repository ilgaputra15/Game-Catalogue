//
//  ContentView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 25/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject private var gameListState = GamesState()
    @State var keyword: Gamekeyword = .all
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0.0) {
                HStack {
                    Image("Icon Game")
                    Text("New and Tranding")
                        .foregroundColor(.white)
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: FavoritesView()) {
                        Image("Favorite Full")
                    }
                }.padding(.horizontal, 30.0)
                Spacer(minLength: 4)
                Text("Base on player counts and realise date")
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 24.0)
                Spacer(minLength: 24)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Gamekeyword.allCases, id: \.self) { keyword in
                            Button(action: {
                                self.keyword = keyword
                                self.gameListState.loadGames(platforms: self.keyword.value)
                            }) {
                                KeywordLableView(name: keyword.rawValue, isSelected: self.keyword == keyword)
                            }
                        }
                    }
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 4.0)
                }
                Spacer(minLength: 16)
                GameListView(games: self.gameListState.games2Array)
                Spacer()
            }
            .onAppear {
                if self.gameListState.games2Array == nil {
                self.gameListState.loadGames(platforms: self.keyword.value)
                }
            }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
        .buttonStyle(PlainButtonStyle())
        .navigationBarColor(UIColor.transparant)
      }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
        
    }
}
