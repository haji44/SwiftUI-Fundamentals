//
//  User.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/10.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthDate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
    
}
