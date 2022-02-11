//
//  WeatherViewModel.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/10.
//

import SwiftUI

@MainActor final class WeatherViewModel: ObservableObject {
    
    @Published var mainWeather: Datum?
    @Published var weekWeather: [Datum] = []
    @Published var cityName: String = "Tokyo"
    @Published var isLoadingView = false    
    
    // MARK: retrieve data from api
    func getWeatherData() {
        isLoadingView = true
        Task {
            do {
                let weather = try await NetWorkManager.shared.getWeatherData(by: "Tokyo")
                mainWeather = weather.data[0]
                weekWeather = Array(weather.data[1...])
                isLoadingView = false
            } catch {
                if let error = error as? WeatherError {
                    // TODO: showing errormessage by custome alert
                    print(error.rawValue)
                    isLoadingView = false
                }
            }
        }
    }
}

