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
    var data: [Datum]
}

struct Datum: Codable {
    var temp: Double
    var datetime: String
    var weather: Weather
}


struct Weather: Codable {
    var code: Int
}


