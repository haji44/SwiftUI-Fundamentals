//
//  EmptyState.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/10.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: LocalizedStringKey
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center) // when the text is long
                    .padding()
            }
            .offset(y: -10)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "empty-order", message: "This is our test message. \nI'm making it")
    }
}
