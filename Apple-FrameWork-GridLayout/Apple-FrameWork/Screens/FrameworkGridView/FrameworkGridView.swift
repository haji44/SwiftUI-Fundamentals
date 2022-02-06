//
//  FrameworkGridView.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/05.
//

import SwiftUI

struct FrameworkGridView: View {
    
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                // within lazy grid the number of view item will be showed screen
                LazyVGrid(columns: viewModel.columns) {
                    // iterating to crate FrameWorkItem
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                // update framework when the user select object
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            // implement to push detail view and set default value or empty state
            // this also responsible for dismiss sub view
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
            
    }
}

