//
//  XDismissButton.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
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
        }.padding()
    }
}


struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isShowingDetailView: .constant(false))
    }
}
