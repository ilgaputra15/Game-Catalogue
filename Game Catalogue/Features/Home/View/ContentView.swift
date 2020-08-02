//
//  ContentView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 25/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var gameListState = GamesState()
    @State var keyword: Gamekeyword = .all
    @State var navBarHidden: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 0.0) {
                    HStack {
                        Image("Icon Game")
                        Text("New and Tranding")
                            .foregroundColor(.white)
                            .font(.system(size: 28))
                            .fontWeight(.bold)
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
                                    KeywordLable(name: keyword.rawValue, isSelected: self.keyword == keyword)
                                }
                            }
                        }
                        .padding(.horizontal, 24.0)
                        .padding(.vertical, 4.0)
                    }
                    Spacer(minLength: 16)
                    ScrollView {
                        GameList(games: self.gameListState.games2Array)
                    }
                    HStack {
                        Spacer()
                        NavigationLink(destination: ProfileView()) {
                        Image("Profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50.0, height: 50.0)
                            .clipped()
                            .cornerRadius(50)
                        }
                        Spacer()
                    }.padding(.vertical, 8.0)
                }
                .onAppear {
                    if self.gameListState.games2Array == nil {
                    self.gameListState.loadGames(platforms: self.keyword.value)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .buttonStyle(PlainButtonStyle())
            .navigationBarColor(UIColor.transparant)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
