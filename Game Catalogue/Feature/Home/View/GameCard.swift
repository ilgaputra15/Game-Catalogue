//
//  GameCard.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 26/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct GameCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                HStack {
                    HStack {
                      Image("Plus")
                        Text("80")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 3.0)
                    .padding(.horizontal, 6.0)
                    .background(/*@START_MENU_TOKEN@*/Color(red: 0.459, green: 0.459, blue: 0.459)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    Image("X-Box")
                    .frame(width: 12.0, height: 12.0)
                    Image("PlayStation")
                        .frame(width: 12.0, height: 12.0)
                    Image("Windows")
                        .frame(width: 12.0, height: 12.0)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal, 8.0)

                Image("temp image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .cornerRadius(5)
                Text("Game Name")
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
                    
                Text("Release date : Apr 20, 2020")
                    .font(.system(size: 10))
                    .foregroundColor(Color.white)
                    .padding(.top, 6.0)
                    .padding([.leading, .trailing], 8.0)
                HStack {
                    Image("Star")
                    Text("4.5")
                        .font(.system(size: 10))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 6.0)
                .padding(.bottom, 12.0)
                .padding([.leading, .trailing], 8.0)
            }
            .padding(0.0)
            .background(Color(red: 0.345, green: 0.345, blue: 0.345))
            .cornerRadius(8.0)
        }
}

struct GameCard_Previews: PreviewProvider {
    static var previews: some View {
        GameCard()
    }
}
