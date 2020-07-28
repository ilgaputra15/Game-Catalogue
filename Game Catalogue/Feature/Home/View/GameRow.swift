//
//  GameRow.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 26/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct GameRow: View {
    var body: some View {
        HStack {
            GameCard()
            GameCard()
        }
    }
}


struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
         GameRow()
    }
}
