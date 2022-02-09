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
                        .onTapGesture { // when the user tapped ...
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                })
                    .navigationTitle("🍔Appetizers")
                    .disabled(viewModel.isShowingDetail) // when detail view is on the list, the screen interaction shut out
            }
            // this line plays a role which is smilar to viewDidLoad
            // when initialize the screen this implementaion excute
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)

            // MARK: loading view
            if viewModel.isLoading {
                LoadingView()
            }
            
            // MARK: Detail View
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            
        }
        // MARK: Alert
        // so that rimit showing alert in existing the alert
        // aurgument should be binding item
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
