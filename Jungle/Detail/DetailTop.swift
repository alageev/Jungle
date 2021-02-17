//
//  DetailTop.swift
//  Jungle
//
//  Created by Алексей Агеев on 04.10.2020.
//

import SwiftUI

struct DetailTop: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    @State var withImage = false
    
    let name: String
    
    init (name: String, imageId: String) {
        self.name = name
        self.imageLoader.downloadImage(from: imageId)
    }
    
    var body: some View {
        if withImage {
            Image(uiImage: imageLoader.image!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .transition(.opacity)
                .overlay(Text(name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(withImage ? .white : .primary)
                            .padding([.top, .leading])
                            .shadow(radius: 5)
                            .fixedSize(horizontal: false, vertical: true)
                            .transition(.opacity),
                    alignment: .topLeading)
        } else {
            Text(name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding([.top, .leading])
                .fixedSize(horizontal: false, vertical: true)
                .transition(.opacity)
                .onReceive(imageLoader.$image, perform: { image in
                    guard image != nil else {
                        return
                    }
                    withAnimation(.easeInOut(duration: 0.5)) {
                        withImage = true
                    }
                })
        }
    }
}

#if DEBUG
struct DetailTop_Previews: PreviewProvider {
    static var previews: some View {
        DetailTop(name: testBeverages[0].name, imageId: testBeverages[0].id.uuidString)
            .previewLayout(.sizeThatFits)
    }
}
#endif
