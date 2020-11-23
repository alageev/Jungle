//
//  Food.swift
//  Jungle
//
//  Created by Алексей Агеев on 21.09.2020.
//

import Foundation

struct Food: Decodable, Identifiable {
    let id: UUID
    let name: String
    let type: String
    let weight: Int
    let price: Int
    let description: String
}
