//
//  FrameworkDetailView.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/05.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var frameWork: Framework
    
    var body: some View {
        FrameworkTitleView(framework: frameWork)
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(frameWork: )
    }
}
