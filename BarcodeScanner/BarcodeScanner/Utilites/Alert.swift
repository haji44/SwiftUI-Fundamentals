//
//  Alert.swift
//  BarcodeScanner
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: Text("Invalid Device Input"),
                                              message: Text("Something is wrong with camera"),
                                              dismissButton: .default(Text("OK")))
    static let invalidScanedType = AlertItem(title: Text("Invalid Scan Type"),
                                              message: Text("The value scanned is not valid."),
                                              dismissButton: .default(Text("OK")))
}
