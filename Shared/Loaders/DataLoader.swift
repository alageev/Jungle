//
//  DataLoader.swift
//  Jungle
//
//  Created by Алексей Агеев on 13.09.2020.
//

import Foundation
import Combine

final class DataLoader: ObservableObject {
    @Published var beverages: [Beverage] = []
    @Published var food: [Food] = []
    @Published var events: [Event] = []

    init() {
        loadBeverages()
        loadFood()
        loadEvents()
    }
    
    private func loadBeverages() {
        URLSession.shared.dataTaskPublisher(for: Constants.shared.beverages)
            .map { $0.data }
            .decode(type: [Beverage].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: &$beverages)
    }
    
    private func loadFood() {
        URLSession.shared.dataTaskPublisher(for: Constants.shared.foods)
            .map { $0.data }
            .decode(type: [Food].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: &$food)
    }
    
    private func loadEvents() {
        URLSession.shared.dataTaskPublisher(for: Constants.shared.events)
            .map { $0.data }
            .decode(type: [Event].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: &$events)
    }
}
