//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers, rowContent: { appetizer in
                AppetizerListCell(appetizer: appetizer)
            })
            .navigationTitle("Appetizers🍛")
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
