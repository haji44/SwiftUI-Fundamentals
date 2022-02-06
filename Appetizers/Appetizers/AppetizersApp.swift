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
    var body: some Scene {
        WindowGroup {
            // this view used as initial view of entire app
            AppetizerTabView()
        }
    }
}
