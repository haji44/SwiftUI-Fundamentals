//
//  WeatherData.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/02.
//

import Foundation

// MARK: Model
struct WeatherData: Codable {
    // MARK: Property
    var data: [Datum] = []    
}

struct Datum: Codable, Identifiable {
    var temp: Double
    var datetime: String
    var weather: Weather
}

struct Weather: Codable {
    var code: Int
}

struct MockData {
    static let sampleWeather = WeatherData(data: [Datum(temp: 99.9, datetime: "2020-02-02", weather: Weather(code: 300)),
                                                  Datum(temp: 11.1, datetime: "2020-02-03", weather: Weather(code: 300)),
                                                  Datum(temp: 99.9, datetime: "2020-02-04", weather: Weather(code: 300))
                                                 ])
    static let smapleDatum  = Datum(temp: 99.9, datetime: "2020-02-02", weather: Weather(code: 300))
}

extension Datum {
    var id: UUID { return UUID( )}
}
