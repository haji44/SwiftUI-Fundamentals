//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI

// this view contains cordinator to delegate the methods between view and UIKit
struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    // 1. this method is responsible for create certain UIKit viewcontroller
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    // 2. make coordinator class which is declared within struct
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    // when the multiple coordinator needs in app
    // this class should be declared in struct
    final class Coordinator: NSObject, ScannerVCDlegate {

        private let scannerView: ScannerView

        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
            
        // this method tell the scanner view that barcode exist
        // and should change that value
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurFace(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScanedType
            }
        }
    }
}

//struct ScannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScannerView(scannedCode: .constant("123456"), alertItem: AlertContext.invalidScanedType)
//    }
//}
