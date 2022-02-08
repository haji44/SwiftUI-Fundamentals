//
//  ListViewCell.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

struct AppetizerListCell: View {
    
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)  // to cutting corner size should be over the rimb
                .cornerRadius(8)                // radius set after the frame setting
            VStack (alignment: .leading, spacing: 6) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
            .padding()
        }
    }
}

struct ListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
