//
//  Event.swift
//  Jungle
//
//  Created by Алексей Агеев on 10.01.2021.
//

import Foundation

struct Event: Decodable, Identifiable {
    var id: UUID
    var title: String
    var description: String
    var date: Date
    
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
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        date = dateFormatter.date(from: dateString) ?? Date()
    }
}
