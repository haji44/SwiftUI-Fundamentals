//
//  WEBackGround.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/11.
//

import SwiftUI

struct WEBackGround: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("topColor"), Color("bottomColor")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct WEBackGround_Previews: PreviewProvider {
    static var previews: some View {
        WEBackGround()
    }
}
