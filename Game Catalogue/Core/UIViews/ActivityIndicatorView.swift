//
//  IndicatorView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 30/07/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    var style: UIActivityIndicatorView.Style = .medium
    var color: UIColor?
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: style)
        view.startAnimating()
        if let color = color {
            view.color = color
        }
        return view
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView(style: .large)
    }
}
