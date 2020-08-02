//
//  DetailUIView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 30/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject private var gamesState = GamesState()
    var gameId: Int
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            ActivityIndicatorView(style: .large, color: .gray)
            if gamesState.game != nil {
                ScrollView {
                    GameDetailView(game: self.gamesState.game!)
                    GameDetailDescView(game: self.gamesState.game!)
                }.background(Color.backgroundColor)
            }
        }
        .background(Color.backgroundColor)
        .navigationBarTitle(Text(self.gamesState.game?.name ?? "Detail"), displayMode: .inline)
        .navigationBarColor(UIColor.backgroundColor)
        .onAppear {
            self.gamesState.loadGame(id: self.gameId)
        }
    }
}

struct GameDetailView: View {
    @ObservedObject var imageLoader = ImageLoader()
    var game: GameDetail
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.greyishBrown)
                ActivityIndicatorView(style: .medium, color: .gray)
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .clipped()
                    .cornerRadius(5)
                }
            }
            .aspectRatio(16/9, contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width)
            Spacer(minLength: 20)
            HStack(alignment: .center) {
                HStack {
                  Image("Plus")
                    Text(String(game.added))
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 3.0)
                .padding(.horizontal, 6.0)
                .background(Color.brownishGrey)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Image("Star")
                    .resizable()
                        .frame(width: 18.0, height: 18.0)
                        .aspectRatio(contentMode: .fit)
                    Text(String(game.rating))
                        .font(.system(size: 16))
                        .foregroundColor(Color.white)
                }
                Spacer()
                ForEach(self.game.platforms) { platform in
                    HStack {
                        if platform.platform.imageResName != nil {
                            Image(platform.platform.imageResName!)
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                        }
                    }
                }
            }
            .padding(.horizontal, 24.0)
            Spacer(minLength: 32)
        }.onAppear {
            self.imageLoader.loadImage(with: URL(string: self.game.backgroundImage)!)
        }
    }
}

struct GameDetailDescView: View {
    var game: GameDetail
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Gendre")
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                    Spacer(minLength: 6.0)
                    Text(game.genreString)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                    Spacer(minLength: 32)
                    Text("Developer")
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                    Spacer(minLength: 6.0)
                    Text(game.developerString)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                    Spacer()
                }.padding(.leading, 36.0).frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .leading)
                
                Rectangle()
                    .fill(Color.brownishGrey)
                    .frame(width: 1.0)
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Release date")
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                    Spacer(minLength: 6.0)
                    Text(game.released.convertDateFormat(from: "yyyy-mm-dd", to: "MMM d, yyyy"))
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                    Spacer(minLength: 32)
                    Text("Publisher")
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                    Spacer(minLength: 6.0)
                    Text(game.publisherString)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                    Spacer()
                }.padding(.leading, 36.0).frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .leading)
            }
            .frame(height: 150.0)
            Spacer(minLength: 36)
            Text("About")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .font(.system(size: 24))
                .padding(.leading, 24.0)
            Spacer(minLength: 12)
            Text(game.descriptionRaw)
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundColor(Color.white)
                .padding(.horizontal, 24.0)
                .lineLimit(nil)
            Spacer(minLength: 20)
            HStack {
                Text("Website : ")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                Text(game.website)
                    .fontWeight(.medium)
                    .font(.system(size: 16))
                    .foregroundColor(Color.white)
                Spacer()
            }
            .padding(.horizontal, 24.0)
            Spacer(minLength: 32.0)
        }
    }
}

struct DetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(gameId: 1)
    }
}
