//
//  ProfileState.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 23/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

class ProfileState: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var githubLink: String = ""
    
    init() {
        ProfileStorage.synchronize()
    }
    
    func getProfile() {
        self.name = ProfileStorage.name
        self.email = ProfileStorage.email
        self.githubLink = ProfileStorage.githubLink
    }
    
    func saveProfile() {
        ProfileStorage.name = name
        ProfileStorage.email = email
        ProfileStorage.githubLink = githubLink
    }
}
