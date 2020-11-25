//
//  Food.swift
//  Jungle
//
//  Created by Алексей Агеев on 21.09.2020.
//

import Foundation

enum FoodType: String, Decodable {
    case khachapuri
    case pate
    case snack
}

struct Food: Decodable, Identifiable {
    let id: UUID
    let name: String
    let type: FoodType
    let weight: Int
    let price: Int
    let description: String?
}
