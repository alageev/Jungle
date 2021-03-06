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
    let cloudinaryLink: String
    let beverages: URL
    let foods: URL
    let events: URL
    
    init() {
        base = URL(string: "https://junglernd.herokuapp.com")!
        
        cloudinaryLink = "cloudinary://541428411528285:NbzLlpp_-jN6hpd6rBNwdIP9yaw@hdqg6qpzc"
        beverages = URL(string: "beverages", relativeTo: self.base)!
        foods     = URL(string: "foods", relativeTo: self.base)!
        events    = URL(string: "events", relativeTo: self.base)!
    }
}
