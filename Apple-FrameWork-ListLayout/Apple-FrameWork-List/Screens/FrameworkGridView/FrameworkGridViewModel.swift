//
//  FrameworkGridViewModel.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI

// this class is responsible for handling change of data
// and we no longer need to create subclass, so declare final modifier
final class FrameworkGridViewModel: ObservableObject {
    
    // annouce whenever the value change
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    // @Published is needed to create observable objects that automatically announce when changes occur.
    @Published var isShowingDetailView = false
    
    // Grid is lazy to minimze the amount of loading data
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]

}
