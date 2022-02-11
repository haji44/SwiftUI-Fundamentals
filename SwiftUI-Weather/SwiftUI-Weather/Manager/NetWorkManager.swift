//
//  NetWorkManager.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/02.
//

import SwiftUI

class NetWorkManager {
    
    // MARK: Property
    static let shared   = NetWorkManager()
    let baseUrl         = "https://api.weatherbit.io/v2.0/forecast/daily?key=ff3eda142949492cbeca9379e032683c&city="
    let decoder         = JSONDecoder()

    
    // MARK: Network call
    func getWeatherData(by cityName: String) async throws -> WeatherData {
        let endpoint = baseUrl + cityName
        
        guard let url = URL(string: endpoint) else {
            throw WeatherError.invalidCityName
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw WeatherError.invalidRespone
        }
        
        do {
            return try decoder.decode(WeatherData.self, from: data)
        } catch {
            throw WeatherError.invalidData
        }
    }
}
