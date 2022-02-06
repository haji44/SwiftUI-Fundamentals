//
//  SafariView.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/06.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    // This method used to create viewcontoroller, beacause SwiftUI doesn't have safariview
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
