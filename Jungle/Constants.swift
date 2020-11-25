//
//  Constants.swift
//  Jungle
//
//  Created by Алексей Агеев on 21.09.2020.
//

import SwiftUI
import Foundation

class Constants {
    
    static let shared = Constants()
    
    private let base: URL
    let cloudinary: String
    let beverages: URL
    let foods: URL
    
    init() {
        base = URL(string: "https://junglernd.herokuapp.com")!
        cloudinary = "cloudinary://541428411528285:NbzLlpp_-jN6hpd6rBNwdIP9yaw@hdqg6qpzc"
        beverages = URL(string: "beverages", relativeTo: self.base)!
        foods     = URL(string: "foods", relativeTo: self.base)!
    }
}
