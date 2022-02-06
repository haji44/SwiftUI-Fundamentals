//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {

    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not yet Scanned" : scannedCode
    }
    
    var statuTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
