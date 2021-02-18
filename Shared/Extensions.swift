//
//  Extensions.swift
//  Jungle
//
//  Created by Алексей Агеев on 10.01.2021.
//

import Foundation

extension Date {
    func day() -> String {
        "\(Calendar.current.component(.day, from: self))"
    }
    
    func month() -> String {
        let value = Calendar.current.component(.month, from: self)
        let months = [
            "января", "февраля", "марта", "апреля", "мая", "июня",
            "июля", "августа", "сентября", "октября", "ноября", "декабря"]
        return months[value - 1]
    }
    
    func year() -> String {
        "\(Calendar.current.component(.year, from: self))"
    }
}
