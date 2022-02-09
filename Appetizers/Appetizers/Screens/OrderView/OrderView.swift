//
//  OrderView.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItem) // perform allow to set method without paranthees
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        
                    } label: {
                        APButton(title: "$\(order.totalPrice ?? 0, specifier: "%.2f") - Add to Order")
                    }
                    .padding(.bottom, 25)
                    
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "Order is Empty")
                }
                
                
            }
            .navigationTitle("Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
