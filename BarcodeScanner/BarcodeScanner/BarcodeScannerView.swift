//
//  ContentView.swift
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

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
//    @State private var isShowingAlert: Bool = false
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                // frame has custome property if you want to fix the edge of screen, you should use infinity
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
                Button {
//                    isShowingAlert = true
                } label: {
                  Text("Tap Me")
                }
            }
            .navigationTitle("Barcode Scanner")
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title: Text("Test"), message: Text("This is a test"), dismissButton: .default(Text("OK")))
//            }
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
