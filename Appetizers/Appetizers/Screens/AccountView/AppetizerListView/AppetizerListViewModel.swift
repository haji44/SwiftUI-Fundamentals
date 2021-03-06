//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true // when method called, start to show the loading view
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APServerError {
                    switch apError {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.invalidComplete
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .ivalidResponse:
                        alertItem = AlertContext.invalidResponse
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}

//        NetworkManager.shared.getAppetizers { [self] result in
//            DispatchQueue.main.async {
//                isLoading = false // this flag should be flipped before finishing loading data
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//
//                    case .unableToComplete:
//                        alertItem = AlertContext.invalidComplete
//
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//
//                    case .ivalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                    }
//                }
//            }
//        }

