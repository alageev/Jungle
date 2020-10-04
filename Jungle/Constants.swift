//
//  Constants.swift
//  Jungle
//
//  Created by Алексей Агеев on 21.09.2020.
//

import SwiftUI
import Foundation

let constants = Constants()

class Constants {
    private let baseUrl = URL(string: "https://junglernd.herokuapp.com")
    let beveragesURL: URL
    let foodsURL: URL
    
    init() {
        beveragesURL   = URL(string: "beverages", relativeTo: self.baseUrl!)!
        foodsURL       = URL(string: "foods", relativeTo: self.baseUrl!)!
    }
}

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
