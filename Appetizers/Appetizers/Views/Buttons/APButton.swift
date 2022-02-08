//
//  APButton.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/09.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey // this type allow using specifire
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 270, height: 50)
            .background(Color.brandPrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}


struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "test title")
    }
}
