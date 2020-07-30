//
//  RxMoyaExtension.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 28/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import Foundation
import RxSwift
import Moya

extension Reactive where Base: MoyaProviderType {
    func request<MODEL: Codable>(_ token: Base.Target, _ model: MODEL.Type) -> Single<MODEL> {
        self.printRequest(token)
        return self.request(token)
            .map { response in
                self.printResponse(response)
                return response
            }
            .map(model)
    }
    
    func printResponse(_ response: Response) {
        #if DEBUG
            do {
                let json = try response.mapJSON()
                print("\n--> [\(response.statusCode)] RESPONSE")
                print(json)
            } catch let error {
                print("Error ->  \(error.localizedDescription)")
            }
        #endif
    }
    
    func printRequest(_ token: Base.Target) {
        #if DEBUG
            print("\n--> [\(token.method.rawValue.uppercased())] \(token.baseURL.absoluteString)\(token.path)")
            if let headers = token.headers {
                print("--> HEADER \n \(headers)")
            }
            print("--> PARAM \\ BODY \n\(token.task)")
        #endif
    }
}
