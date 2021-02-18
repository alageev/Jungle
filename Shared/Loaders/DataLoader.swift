//
//  DataLoader.swift
//  Jungle
//
//  Created by Алексей Агеев on 13.09.2020.
//

import Foundation

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
        URLSession.shared.dataTask(with: Constants.shared.beverages) { data, _, error in
            do {
                guard let data = data else {
                    return
                }
                
                let beverages = try JSONDecoder().decode([Beverage].self, from: data)
                
                DispatchQueue.main.async {
                    self.beverages = beverages
                }
                
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
    
    private func loadFood() {
        URLSession.shared.dataTask(with: Constants.shared.foods) { data, _, error in
            do {
                guard let data = data else {
                    return
                }
                
                let food = try JSONDecoder().decode([Food].self, from: data)
                
                DispatchQueue.main.async {
                    self.food = food
                }
                
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
    
    private func loadEvents() {
        URLSession.shared.dataTask(with: Constants.shared.events) { data, _, error in
            do {
                guard let data = data else {
                    return
                }
                
                let events = try JSONDecoder().decode([Event].self, from: data)
                
                DispatchQueue.main.async {
                    self.events = events
                }
                
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}
