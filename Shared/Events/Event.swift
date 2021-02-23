//
//  Event.swift
//  Jungle
//
//  Created by Алексей Агеев on 10.01.2021.
//

import Foundation

struct Event: Decodable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let date: String
    let numericDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case date
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        let dateString = try container.decode(String.self, forKey: .date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        numericDate = dateFormatter.date(from: dateString) ?? Date()
        dateFormatter.dateFormat = "d MMM y"
        date = dateFormatter.string(from: numericDate)
    }
}
