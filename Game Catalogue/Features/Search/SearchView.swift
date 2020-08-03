//
//  SearchView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 02/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var gamesState = GamesState()
    
    // Setup UITable Style
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                SearchBar(text: $gamesState.searchValue)
                    .padding(.top, 16.0)
                if self.gamesState.searchValue != "" {
                    GameList(games: self.gamesState.games2Array)
                        .padding(.bottom, 8.0)
                    
                } else {
                    Spacer()
                    Text("Looking for something")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white.opacity(0.7))
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Search Games", displayMode: .inline)
        .buttonStyle(PlainButtonStyle())
        .onAppear {
            self.gamesState.setupDebouceSearchGames()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
