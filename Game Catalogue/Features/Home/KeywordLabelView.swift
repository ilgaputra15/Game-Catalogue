//
//  KeywordLable.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 26/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct KeywordLableView: View {
    var name: String
    var isSelected: Bool
    var body: some View {
        HStack {
            if self.isSelected {
                Text(name)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 6.0)
                    .background(Color.greyishBrown)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1))
            } else {
                Text(name)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(Color.brownGrey)
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 6.0)
                    .background(Color.greyishBrown)
                    .cornerRadius(10)
            }
        }
    }
}

struct KeywordLable_Previews: PreviewProvider {
    static var previews: some View {
       KeywordLableView(name: "Ilga", isSelected: false)
    }
}
