//
//  AccountView.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FromTextField? // suggest the filed required to input for a user

    // this enum case represents field of view
    enum FromTextField {
    case firstNmae, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: Person Info
                Section(header: Text("Person Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstNmae)
                        .onSubmit { focusedTextField = .lastName } // set next field
                        .submitLabel(.next) // cofigure the keyboard button text
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next) // cofigure the keyboard button text
                    
                    TextField("Email Name", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil } // dismiss keybord
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("BirthDay", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Chane")
                    }
                }
                // MARK: Requst info
                Section(header: Text("Request")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Freuent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("Account")
            // tool bar used as custome button and appear on top of the keyboard 
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }        
        
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
