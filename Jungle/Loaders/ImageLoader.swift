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
    
    @Published var image: UIImage?
    
    let cloudinary: CLDCloudinary
    
    init () {
        let configuration = CLDConfiguration(cloudinaryUrl: Constants.shared.cloudinaryLink)!
        self.cloudinary = CLDCloudinary(configuration: configuration)
    }
    
    func downloadImage(from url: String) {
        DispatchQueue.global(qos: .userInteractive).async {
            let imageUrl = self.cloudinary.createUrl().generate(url)!
            self.cloudinary.createDownloader().fetchImage(imageUrl, completionHandler: { image, error in
                guard let image = image,
                      error == nil else {
                    print("Error loading image: \(error!)")
                    return
                }
                
                DispatchQueue.main.async {
                    self.image = image
                }
            })
        }
    }
}
