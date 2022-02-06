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
                // within lazy grid the number of view item will be showed screen
            List {
                // iterating to crate FrameWorkItem
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(framework: framework,
                                                                    isShowingDetailView: $viewModel.isShowingDetailView)) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
            
    }
}

