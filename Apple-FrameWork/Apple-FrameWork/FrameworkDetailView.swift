//
//  FrameworkDetailView.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/05.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var frameWork: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack {
            // to set button on the right potision
            // button should be wrapped by HStack
            HStack {
                Spacer()
                Button {
                    isShowingDetailView = false
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
                isShowingSafariView = true
                print("tapped!")
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            // treat error url pattern by default setting
            SafariView(url: URL(string: frameWork.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(frameWork: MockData.sampleFramework, isShowingDetailView: .constant(false))
    }
}
