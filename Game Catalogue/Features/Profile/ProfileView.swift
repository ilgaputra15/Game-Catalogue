//
//  ProfileView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 02/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180.0, height: 180.0)
                    .clipped()
                    .cornerRadius(180)
                Text("Ilga Yulian Putra D")
                    .font(.system(size: 32))
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding(.top, 36.0)
                HStack {
                    Text("Github")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    Text("https://github.com/ilgaputra15")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                }
                .padding(.top, 22.0)
                Spacer()
            }
            .padding(.top, 48.0)
        }
        .navigationBarTitle("Profile Developer", displayMode: .inline)
        .navigationBarColor(UIColor.backgroundColor)
        .buttonStyle(PlainButtonStyle())
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
