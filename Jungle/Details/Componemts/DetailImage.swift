//
//  DetailImage.swift
//  Jungle
//
//  Created by Алексей Агеев on 04.10.2020.
//

import SwiftUI

struct DetailImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    let name: String
    
    init (name: String, image: String) {
        self.name = name
        let imageLoader = ImageLoader()
        imageLoader.downloadImage(from: image)
        self.imageLoader = imageLoader
        self.image = imageLoader.image
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(self.imageLoader.$image) { image in
                    withAnimation {
                        self.image = image
                    }
                }
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
