//
//  FrameworkGridView.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/05.
//

import SwiftUI

struct FrameworkGridView: View {
    
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    // Grid is lazy to minimze the amount of loading data
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                // within lazy grid the number of view item will be showed screen
                LazyVGrid(columns: columns) {
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
                FrameworkDetailView(frameWork: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
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

// Reusable view should be divided into another view
struct FrameworkTitleView: View {
    // to concrete the property type bring a lot of benefits
    // we can handle the name and image name simultaneously
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit() // change font size based on the screen
                .minimumScaleFactor(0.6) // this is indicater of minimum scaleb
        }
        .padding()
    }
}
