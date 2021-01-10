//
//  DataLoader.swift
//  Jungle
//
//  Created by Алексей Агеев on 13.09.2020.
//

import Foundation

final class DataLoader: ObservableObject {
    @Published var beverages: [Beverage] = []
    @Published var foods: [Food] = []
    @Published var events: [Event] = []

//    @Published var loaded: () -> Bool = { false }
    
    init() {
//        loaded = {
//            self.beverages.count > 0 && self.foods.count > 0
//        }
        self.load()
    }
    
    func load() {
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
        
        URLSession.shared.dataTask(with: Constants.shared.foods) { data, _, error in
            do {
                guard let data = data else {
                    return
                }
                let foods = try JSONDecoder().decode([Food].self, from: data)
                
                DispatchQueue.main.async {
                    self.foods = foods
                }
                
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
        
        URLSession.shared.dataTask(with: Constants.shared.events) { data, _, error in
            do {
                guard let data = data else {
                    return
                }
                let foods = try JSONDecoder().decode([Event].self, from: data)
                
                DispatchQueue.main.async {
                    self.events = foods
                }
                
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}
