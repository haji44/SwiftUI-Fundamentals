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
        VStack {
            // to set button on the right potision
            // button should be wrapped by HStack
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    // color should be able to visible for both darkmode and light mode
                    // in that case label of UIkit is appropriate
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            Spacer()
            
            FrameworkTitleView(framework: frameWork)
            Text(frameWork.description)
                .font(.body)
                .padding()

            Spacer()
            
            Button {
                
            } label: {
                AFButton(title: "Learn More")
            }

        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(frameWork: MockData.sampleFramework)
    }
}
