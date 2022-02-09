//
//  NetworkManager.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import Foundation
import SwiftUI

final class NetworkManager {
    
    static let shared = NetworkManager() // this object is needed for singledton
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    static let appetizerURL = baseURL + "appetizers"
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APServerError>) -> Void) {
        guard let url = URL(string: NetworkManager.appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.ivalidResponse))
                return
            }
            
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let appetizers = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(appetizers.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }        
        task.resume()
    }
    
    // if image doesn't exist, we will use the place holder image
    // so we don't have to handling the error case
    func downLoadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        // to prevent from loading image vainly we use cache
        // 1. make sure the key from aurgments
        let cacheKey = NSString(string: urlString)
        
        // 2. image already exist in cache return cache data
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
                
        let task = URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
        }
        task.resume()
    }
}
