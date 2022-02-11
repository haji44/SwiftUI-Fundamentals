//
//  WeatherWeekView.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/10.
//

import SwiftUI

struct WeatherWeekView: View {
    
    var weather: Datum
    
    var body: some View {
        VStack {
            Text(weather.datetime.toMonthAndDays())
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Text(weather.datetime.toDaysOfWeek())
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: SFSymbol.getSFSymbolString(weather.weather.code))
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(weather.tempearture)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherWeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWeekView(weather: MockData.smapleDatum)
    }
}
