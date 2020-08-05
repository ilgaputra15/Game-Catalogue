//
//  HomeView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 05/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  init() {
    UITabBar.appearance().barTintColor = UIColor.backgroundColor
  }
    var body: some View {
      TabView {
        NavigationView {
          GamesView()
        }
        .tabItem {
          Text("Games")
          Image(systemName: "list.dash")
        }
        NavigationView {
          SearchView()
        }
        .tabItem {
          Text("Search")
          Image(systemName: "magnifyingglass")
        }
      ProfileView()
        .tabItem {
          Text("Profile Developer")
          Image(systemName: "person.circle.fill")
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
