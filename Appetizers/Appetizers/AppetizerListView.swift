//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

struct AppetizerListView: View {
    
    // get the data via acessing api
    // to observe the change value, declare State
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        // in order to set loading on the top of view
        // ZStack need
        ZStack {
            
            NavigationView {
                List(viewModel.appetizers, rowContent: { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                })
                    .navigationTitle("Appetizers🍛")
            }
            // this line plays a role which is smilar to viewDidLoad
            // when initialize the screen this implementaion excute
            .onAppear {
                viewModel.getAppetizers()
            }
            // so that rimit showing alert in existing the alert
            // aurgument should be binding item
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
