//
//  String+Ext.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/02/04.
//

import Foundation

extension String {

    func toDate() -> Date? {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyy-MM-dd"
        dateFormmater.locale = Locale(identifier: "ja_JP")
        dateFormmater.timeZone = .current
        return dateFormmater.date(from: self)
    }
    
    func toDaysOfWeek() -> String {
        guard let date = self.toDate() else { return "N/A"}
        return date.convertToDayOfTheWeek()
    }
    
    func toMonthAndDays() -> String {
        guard let date = self.toDate() else { return "N/A" }
        return date.convertToMonthDate()
    }
}
