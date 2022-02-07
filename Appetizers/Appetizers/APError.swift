//
//  APError.swift
//  Appetizers
//
//  Created by kitano hajime on 2022/02/07.
//

import Foundation
import SwiftUI

enum APError: Error {
    case invalidURL
    case ivalidResponse
    case invalidData
    case unableToComplete
}
