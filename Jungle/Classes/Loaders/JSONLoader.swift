//
//  JSONLoader.swift
//  Jungle
//
//  Created by Алексей Агеев on 13.09.2020.
//

import Foundation

class JSONLoader<T: Decodable>: ObservableObject {
    @Published var data: [T] = [T]()
    var isLoaded = false

    init(url: URL) {
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringCacheData
        URLSession.shared.dataTask(with: request) { data, _, error in
            do {
                guard let data = data else { fatalError("Invalid Data") }
                let decodedJSON = try JSONDecoder().decode([T].self, from: data)
                DispatchQueue.main.async {
                    self.data = decodedJSON
                    self.isLoaded = true
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}
