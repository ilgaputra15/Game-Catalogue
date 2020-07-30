//
//  BuildConfig.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 28/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation

enum BuildConfig: String {
    case baseURL = "BASE_URL"
}

extension BuildConfig {
    static func getString(key: BuildConfig) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String ?? ""
    }
}
