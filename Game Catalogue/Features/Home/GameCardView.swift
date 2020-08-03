//
//  GameCard.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 26/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct GameCardView: View {
    var game: Game
    
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        NavigationLink(destination: DetailView(gameId: game.id)) {
        VStack(alignment: .leading, spacing: 0) {
                HStack {
                HStack {
                  Image("Plus")
                    Text(String(game.added))
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 3.0)
                .padding(.horizontal, 6.0)
                .background(Color.brownishGrey)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                Spacer()
                ForEach(self.game.platforms) { platform in
                    HStack {
                        if platform.platform.imageResName != nil {
                            Image(platform.platform.imageResName!)
                            .frame(width: 12.0, height: 12.0)
                        }
                    }
                    
                }
            }
            .padding(.vertical, 10.0)
            .padding(.horizontal, 8.0)
            ZStack {
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                ActivityIndicatorView()
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .clipped()
                    .cornerRadius(5)
                }
            }
            .aspectRatio(16/10, contentMode: .fit)
            .cornerRadius(5)
                
                Text(game.name)
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .padding([.top, .leading, .trailing], 8.0)
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 1)
                    .padding(.horizontal, 8.0)
                    .padding(.top, 6.0)
                    
                    .edgesIgnoringSafeArea(.horizontal)
                    
            Text("Release date : \(game.released.convertDateFormat(from: "yyyy-mm-dd", to: "MMM d, yyyy"))")
                    .font(.system(size: 10))
                    .foregroundColor(Color.white)
                    .padding(.top, 6.0)
                    .padding([.leading, .trailing], 8.0)
                HStack {
                    Image("Star")
                        .resizable()
                        .frame(width: 10.0, height: 10.0)
                    Text(String(game.rating))
                        .font(.system(size: 10))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 6.0)
                .padding(.bottom, 12.0)
                .padding([.leading, .trailing], 8.0)
            }
        .background(Color.greyishBrown)
            .cornerRadius(8.0)
        .onAppear {
            self.imageLoader.loadImage(with: URL(string: self.game.backgroundImage)!)
        }
        }
    }
}

struct GameCard_Previews: PreviewProvider {
    static var previews: some View {
        GameCardView(game: Game.stubbedGames[5])
    }
}
