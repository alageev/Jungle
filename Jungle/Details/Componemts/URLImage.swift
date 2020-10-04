//
//  URLImage.swift
//  Jungle
//
//  Created by Алексей Агеев on 04.10.2020.
//

import SwiftUI

struct URLImage: View {
    @StateObject private var loader: ImageLoader
    
    init(url stringURL: String) {
        let url = URL(string: stringURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        loader.load()
        
        if let loadedImage = loader.image {
            return Image(uiImage: loadedImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        
        return Image("Placeholder")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
