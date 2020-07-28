//
//  ContentView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 25/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var keyword: Gamekeyword = .all
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 0.0) {
                Spacer(minLength: 16)
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
                        ForEach (Gamekeyword.allCases, id: \.self) {keyword in
                            Button(action: { self.keyword = keyword }) {
                            KeywordLable(name: keyword.rawValue, isSelected: self.keyword == keyword)
                            }
                        }
                    }
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 4.0)
                }
                Spacer(minLength: 20)
                ScrollView {
                    ForEach(0..<5) {_ in
                        GameRow()
                    }
                    .padding(.horizontal, 24.0)
                }
                .padding(.bottom, 8.0)
                
                Spacer(minLength: 16.0)
                HStack {
                    Spacer()
                    Image("test")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60.0, height: 60.0)
                        .clipped()
                        .cornerRadius(60)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
