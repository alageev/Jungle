//
//  DetailImage.swift
//  Jungle
//
//  Created by Алексей Агеев on 04.10.2020.
//

import SwiftUI

struct DetailImage: View {
    @ObservedObject var imageLoader: ImageLoader
    
    let name: String
    
    init (name: String, image: String) {
        self.name = name
        self.imageLoader = ImageLoader()
        self.imageLoader.downloadImage(from: image)
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Image(uiImage: imageLoader.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 40)
                .padding(.leading)
                .shadow(color: .black, radius: 5)
        }
    }
}

struct DetailImage_Previews: PreviewProvider {
    static var previews: some View {
        DetailImage(name: testBeverages[0].name, image: testBeverages[0].id.uuidString)
            .previewLayout(.sizeThatFits)
    }
}
