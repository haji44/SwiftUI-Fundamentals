//
//  Date+Ext.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/04.
//

import Foundation

extension Date {

    func convertToDayOfTheWeek() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "EEE"
        return dateformatter.string(from: self)
    }
    
    // Example : 12/01
    func convertToMonthDate() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "M/dd"
        return dateformatter.string(from: self)
    }
}
