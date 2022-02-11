//
//  WeatherWeekView.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/10.
//

import SwiftUI

struct WeatherWeekView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherWeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWeekView(dayOfWeek: MockData.smapleDatum.datetime.toDaysOfWeek(),
                        imageName: SFSymbol.getSFSymbolString(300),
                        temperature: Int(MockData.smapleDatum.temp))
    }
}
