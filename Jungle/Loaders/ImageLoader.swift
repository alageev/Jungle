//
//  ImageLoader.swift
//  Jungle
//
//  Created by Алексей Агеев on 14.09.2020.
//

import Foundation
import Cloudinary
import UIKit

final class ImageLoader: ObservableObject {
    let downloader: CLDDownloader
    let cloudinary: CLDCloudinary
    let fileName = UUID().uuidString
    
    @Published var image: UIImage = UIImage(imageLiteralResourceName: "Placeholder")
    
    init () {
        let config = CLDConfiguration(cloudinaryUrl: Constants.shared.cloudinary)!
        self.cloudinary = CLDCloudinary(configuration: config)
        self.downloader = cloudinary.createDownloader()
    }
    
    func downloadImage(from url: String) {
        DispatchQueue.global(qos: .userInteractive).async {
            let imageUrl = self.cloudinary.createUrl().generate(url)!
            self.downloader.fetchImage(imageUrl, completionHandler: { (image, error) in
                if let error = error {
                    print("Error loading image: \(error)")
                }
                DispatchQueue.main.async {
                    self.image = image ?? UIImage(imageLiteralResourceName: "Placeholder")
                }
            })
        }
    }
}
