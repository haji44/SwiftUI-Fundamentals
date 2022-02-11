//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/08.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool // this flag is fliped by x button
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 225)
            
            VStack {
                Text(appetizer.name) // Dish name
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories) cal")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer() // spacer push up the components to top potision
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30) // (direction, value)

        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetail = false
        }, label: {
            XDismissButton()
        }), alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        // Spacing is indicator of space between every child
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
