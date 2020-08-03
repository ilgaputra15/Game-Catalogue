//
//  SearchBar.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 02/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $text)
                    .foregroundColor(.primary)
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8.0)
        }
        .padding(.horizontal)
    }
}

struct SearchBarPreview: View {
    @State private var searchText = "tex"
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            Spacer()
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarPreview()
    }
}
