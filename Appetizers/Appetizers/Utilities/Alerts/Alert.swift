//
//  Alert.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

// this object needs to declare two area
// 1: Within the ViewModel which is tried to show this alert (@Published)
// 2: Handling the error and occurence (@Binding)
struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


// Context used in handling the error
// so we should make sure tha every error type identically
// in this project, we should make sure the APError
struct AlertContext {
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid. Please contac support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid response from the server. Please try again later or contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. If this persists, please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidComplete  = AlertItem(title: Text("Server Error"),
                                       message: Text("Unable to complete your request at this time. Please check your internet connection"),
                                       dismissButton: .default(Text("OK")))
}
