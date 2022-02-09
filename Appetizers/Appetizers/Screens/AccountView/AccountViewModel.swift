//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/09.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data? // this is defaults
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.sucessSaveUserData
        } catch {
            alertItem = AlertContext.failSaveUserData
        }
    }
    
    
    func retrieveUser() {
        guard let userData = userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.failSaveUserData
        }
        
    }
    
    // this property is responsible for text field validation
    // then used in saving data method
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidInput
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }

}
