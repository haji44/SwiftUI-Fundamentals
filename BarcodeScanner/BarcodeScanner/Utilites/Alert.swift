//
//  Alert.swift
//  BarcodeScanner
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with camera",
                                              dismissButton: .default(Text("OK")))
    static let invalidScanedType = AlertItem(title: "Invalid Scan Type",
                                              message: "The value scanned is not valid.",
                                              dismissButton: .default(Text("OK")))
}
