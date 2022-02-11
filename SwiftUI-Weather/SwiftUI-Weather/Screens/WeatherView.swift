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
            
            if viewModel.isLoadingView {
                LoadingView()
            } else {
                VStack {
                    CityTextView(cityName: viewModel.cityName)
                    WeatherMainView(weather: viewModel.mainWeather ?? MockData.smapleDatum)
                        .padding(.bottom, 20)

                    ScrollView(.horizontal) {
                        HStack(alignment: .center, spacing: 20) {
                            ForEach(viewModel.weekWeather) { weekWeather in
                                WeatherWeekView(weather: weekWeather)
                            }
                        }
                    }
                    .padding(30)
                }
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



