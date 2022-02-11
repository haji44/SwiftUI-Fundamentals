//
//  SFSymbol.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/04.
//

import Foundation

enum SFSymbol {
    
    static func getSFSymbolString(_ code: Int) -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if hour > 5 && hour < 18 {
            switch code/100 {
            case 2:
                return "cloud.bolt"
            case 3:
                return "cloud.heavyrain.fill"
            case 5:
                return "cloud.sun.rain.fill"
            case 6:
                return "cloud.sun.fill"
            case 7:
                return "smoke.fill"
            case 8:
                return "sun.max.fill"
            case 9:
                return "aqi.low"
            default:
                fatalError("This case doesn't exist")
            }
        } else {
            switch code/100 {
            case 2:
                return "cloud.bolt"
            case 3:
                return "cloud.heavyrain.fill"
            case 5:
                return "cloud.moon.rain.fill"
            case 6:
                return "cloud.snow.fill"
            case 7:
                return "smoke.fill"
            case 8:
                return "moon.stars.fill"
            case 9:
                return "aqi.low"
            default:
                fatalError("This case doesn't exist")
            }
        }

    }
}

