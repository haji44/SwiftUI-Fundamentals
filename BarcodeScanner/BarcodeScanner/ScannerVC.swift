//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by kitano hajime on 2022/02/06.
//

import UIKit
import AVFoundation
import SwiftUI

enum CameraError: String {
    case invalidDeviceInput = "Something is wrong with the camera."
    case invalidScannedValue = "The value scanned is not valid. This app scans EAN-8 and EAN-13"
}

// this delegation called in the cordinator class (ScannerView)
protocol ScannerVCDlegate: class {
    func didFind(barcode: String) // when find barcode this method excute
    func didSurFace(error: CameraError) // when error happen this method excute
}

final class ScannerVC: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerVCDlegate!
    
    init(scannerDelegate: ScannerVCDlegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let previewLayer = previewLayer else {
            scannerDelegate.didSurFace(error: .invalidDeviceInput)
            return
        }
        
        previewLayer.frame = view.layer.bounds
    }
    
    
    // this method used to start capture settion
    // in this method also handle the error
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            scannerDelegate.didSurFace(error: .invalidDeviceInput)
            return
        }
        
        let videoInput: AVCaptureInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            scannerDelegate.didSurFace(error: .invalidDeviceInput)
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            scannerDelegate.didSurFace(error: .invalidDeviceInput)
            return
        }
        
        let metaDataOutPut = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutPut) {
            captureSession.addOutput(metaDataOutPut)
            metaDataOutPut.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutPut.metadataObjectTypes = [.ean8, .ean13]
        } else {
            scannerDelegate.didSurFace(error: .invalidScannedValue)
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
}

// this extention is needed to determin the barcode
extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            scannerDelegate.didSurFace(error: .invalidScannedValue)
            return
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate.didSurFace(error: .invalidScannedValue)
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            scannerDelegate.didSurFace(error: .invalidScannedValue)
            return
        }
        
        // When the barcode are founded, delegate excute
        scannerDelegate.didFind(barcode: barcode)
    }
}
