//
//  LoadingView.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

// this struct is responsible for creating UIKit components
// you need to create View to show for the user
struct ActivityIndicator: UIViewRepresentable {
    
    // within this method, we should create UIKit View
    // return compatable versiono of swift ui view
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let acitivityIndicatorView = UIActivityIndicatorView(style: .large)
        acitivityIndicatorView.color = UIColor.brandPrimary
        acitivityIndicatorView.startAnimating()
        return acitivityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

// this view show the screen and use above code
struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicator()
        }
    }
}
