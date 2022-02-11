//
//  WeatherData.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/02.
//

import Foundation

struct WeatherData: Codable {
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
    static let sampleWeather = WeatherData(data: [Datum(temp: 11.1, datetime: "2020-02-02", weather: Weather(code: 300)),
                                                  Datum(temp: 22.2, datetime: "2020-02-03", weather: Weather(code: 400)),
                                                  Datum(temp: 33.3, datetime: "2020-02-04", weather: Weather(code: 400))])
    static let smapleDatum  = Datum(temp: 11.1, datetime: "2020-02-02", weather: Weather(code: 300))
}

extension Datum {
    var id: UUID { UUID()}
    var tempearture: Int { Int(temp) }
}
