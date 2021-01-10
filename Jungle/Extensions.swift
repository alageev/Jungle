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
        switch value {
        case 1:
            return "января"
        case 2:
            return "февраля"
        case 3:
            return "марта"
        case 4:
            return "апреля"
        case 5:
            return "мая"
        case 6:
            return "июня"
        case 7:
            return "июля"
        case 8:
            return "августа"
        case 9:
            return "сентября"
        case 10:
            return "октября"
        case 11:
            return "ноября"
        case 12:
            return "декабря"
        default:
            return ""
        }
    }
    func year() -> String {
        "\(Calendar.current.component(.year, from: self))"
    }
}
