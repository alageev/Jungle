//
//  Data.swift
//  Jungle
//
//  Created by Алексей Агеев on 13.09.2020.
//

import SwiftUI

let testBeverages: [Beverage] = load("testBeverages.json")
let testFoods: [Food] = load("testFoods.json")
let testEvents: [Event] = load("testEvents.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
