//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import SwiftUI

// main indicate entrypoint of application
@main
struct AppetizersApp: App { // App protcol allows the app to show multiple screen
    
    var order = Order() // this property used in multiplu view so declared as EnvironmentObject
    
    var body: some Scene {
        WindowGroup {
            // this view used as initial view of entire app
            AppetizerTabView().environmentObject(order)
        }
    }
}
