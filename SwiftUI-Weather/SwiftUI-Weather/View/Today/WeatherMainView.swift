//
//  WeatherMainView.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/10.
//

import SwiftUI

struct WeatherMainView: View {
    var temperature: Int
    var imageName: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(40)        
    }
}


struct WeatherMainView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainView(temperature: Int(MockData.smapleDatum.temp), imageName: SFSymbol.getSFSymbolString(200))
    }
}

