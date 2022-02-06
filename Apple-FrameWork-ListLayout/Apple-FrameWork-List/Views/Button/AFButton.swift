//
//  AFButton.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI

// This struct is only responsible for
struct AFButton: View {
    
    var title: String
    
    var body: some View {
        Button {
        } label: {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "Test Title")
    }
}
