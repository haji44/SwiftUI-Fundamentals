//
//  RemoteImage.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/08.
//

import SwiftUI

// this class is responsible for loading image and noticing the update image
final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downLoadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage) // cast UIImage to Image
            }
        }
    }
}


// this is the helper to set up the object for one Image
struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


// this struct orgnised above element
struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoadar = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoadar.image)
            .onAppear {
                imageLoadar.load(fromURLString: urlString)
            }
    }
}
