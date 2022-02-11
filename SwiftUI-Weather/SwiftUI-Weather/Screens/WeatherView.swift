//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/01/30.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            WEBackGround()
            
            VStack {
                CityTextView(cityName: viewModel.cityName)
                WeatherMainView(temperature: Int(viewModel.mainWeather?.temp ?? 0), imageName: SFSymbol.getSFSymbolString(viewModel.mainWeather?.weather.code ?? 200))
                
                    .padding(.bottom, 40)
                HStack(spacing: 20) {
                    ForEach(viewModel.weekWeather) { weekWeather in
                        WeatherWeekView(dayOfWeek: weekWeather.datetime.toDaysOfWeek(), imageName: SFSymbol.getSFSymbolString(weekWeather.weather.code), temperature: Int(weekWeather.temp))
                    }
                }
            }
            Spacer()
            
            Spacer()
            if viewModel.isLoadingView {
                LoadingView()
            }
        }
        .onAppear {
            viewModel.getWeatherData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text("\(cityName)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}



