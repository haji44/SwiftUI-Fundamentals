//
//  Appetizer.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(name: "test",
                                           description: "test",
                                           price: 9.99,
                                           imageURL: "asian-flank-steak",
                                           calories: 1,
                                           protein: 2,
                                           carbs: 3)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
}
