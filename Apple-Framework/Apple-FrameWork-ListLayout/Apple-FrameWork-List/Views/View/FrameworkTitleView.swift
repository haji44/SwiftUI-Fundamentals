//
//  FrameworkTitleView.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI

// Reusable view should be divided into another view
struct FrameworkTitleView: View {
    // to concrete the property type bring a lot of benefits
    // we can handle the name and image name simultaneously
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit() // change font size based on the screen
                .minimumScaleFactor(0.6) // this is indicater of minimum scaleb
                .padding()
        }
    }
}

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}
