//
//  Storage.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 23/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation

struct ProfileStorage {
    static let setProfileKey = "state"
    static let nameKey = "name"
    static let emailKey = "email"
    static let githubKey = "github"
    
    static var isSetProfile: Bool {
        get {
            return UserDefaults.standard.bool(forKey: setProfileKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: setProfileKey)
        }
    }
    
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    static var githubLink: String {
        get {
            return UserDefaults.standard.string(forKey: githubKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: githubKey)
        }
    }
    
    static func synchronize() {
        UserDefaults.standard.synchronize()
    }
}
