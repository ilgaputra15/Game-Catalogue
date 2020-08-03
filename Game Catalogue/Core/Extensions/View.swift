//
//  View.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 01/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}
