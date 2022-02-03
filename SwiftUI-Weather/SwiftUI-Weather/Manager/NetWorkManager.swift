//
//  NetWorkManager.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/02.
//

import SwiftUI

struct NetWorkManager {
    
    // MARK: Property
    static let shared   = NetWorkManager()
    let baseUrl         = "https://api.weatherbit.io/v2.0/forecast/daily?city="
    let decoder         = JSONDecoder()
        
    
    // MARK: Network call
    func getWeatherData() async throws -> WeatherData {
        // TODO: connect api
        let endopoint = "https://api.weatherbit.io/v2.0/forecast/daily?city=Raleigh&country=US&key=ff3eda142949492cbeca9379e032683c"

        guard let url = URL(string: endopoint) else {
            throw WeatherError.invalidCityName
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw WeatherError.invalidRespone
        }

        
        // TODO: parse data from api into model
        do {
            return try decoder.decode(WeatherData.self, from: data)
        } catch {
            throw WeatherError.invalidData
        }
    }
    
    static func getSFSymbolString(in code: Int) -> String {
        switch code {
        case 2:
            return "cloud.bolt"
        case 3:
            return "cloud.heavyrain.fill"
        case 5:
            return "cloud.moon.bolt.fill"
        case 6:
            return "cloud.snow.fill"
        case 7:
            return "smoke.fill"
        case 8:
            return "sun.min"
        case 9:
            return "aqi.low"
        default:
            fatalError("This case doesn't exist")
        }
    }

}
