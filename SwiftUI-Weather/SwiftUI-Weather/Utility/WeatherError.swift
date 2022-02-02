//
//  Error.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/02.
//

import Foundation
import SwiftUI


enum WeatherError: String, Error {
    case invalidCityName    = "City name went wrong."
    case invalidRespone     = "Bad api reponse"
    case invalidData        = "Data went wrong"
}
