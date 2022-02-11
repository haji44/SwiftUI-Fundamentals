//
//  WeatherMainView.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/10.
//

import SwiftUI

struct WeatherMainView: View {
    
    var weather: Datum
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: SFSymbol.getSFSymbolString(weather.weather.code))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(weather.tempearture)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
            Text(weather.datetime.toMonthAndDays())
                .font(.system(size: 30, weight: .light))
                .foregroundColor(.white)
            
            Text(weather.datetime.toDaysOfWeek())
                .font(.system(size: 30, weight: .light))
                .foregroundColor(.white)
        }
        .padding(40)
    }
}


struct WeatherMainView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainView(weather: MockData.smapleDatum)
    }
}

