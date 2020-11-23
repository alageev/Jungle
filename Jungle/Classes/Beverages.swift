//
//  Beverages.swift
//  Jungle
//
//  Created by Алексей Агеев on 21.09.2020.
//

import Foundation

struct Beverage: Decodable, Identifiable {
    let id: UUID
    let name: String
    let breweryName: String
    let city: String
    let style: String
    let alcohol: Double
    let bitterness: Int
    let volume: [Double]
    let price: [Int]
//    let imageLink: String
    let tapNumber: Int
    let description: String
}
