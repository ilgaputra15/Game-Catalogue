//
//  String.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 30/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import UIKit

extension String {
    func convertDateFormat(from input: String, to output: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = input
        let showDate = inputFormatter.date(from: self)
        inputFormatter.dateFormat = output
        let resultString = inputFormatter.string(from: showDate!)
        return resultString
    }
}
