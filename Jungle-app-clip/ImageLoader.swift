//
//  ImageLoader.swift
//  Jungle
//
//  Created by Алексей Агеев on 14.09.2020.
//

import UIKit

final class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    func loadImage(for url: String) {
        guard let url = URL(string: "https://res.cloudinary.com/hdqg6qpzc/image/upload/\(url)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
