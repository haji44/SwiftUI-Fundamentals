//
//  FrameworkDetailViewModel.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/10.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    @Published var isShowingSafariView: Bool = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}
