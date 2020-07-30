//
//  BaseApi.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 28/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation
import Moya

protocol BaseApi: TargetType {}

extension BaseApi {
    var baseHeaders: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var baseUrl: String {
        return BuildConfig.getString(key: .baseURL)
    }
    
    var baseURL: URL {
        return URL(string: baseUrl)!
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return baseHeaders
    }
}
