//
//  CustomModifier.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/10.
//

import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}
