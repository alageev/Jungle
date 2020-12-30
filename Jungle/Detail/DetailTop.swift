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
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            if withImage {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .transition(.opacity)
            }
            Text(name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(withImage ? .white : .primary)
                .padding([.top, .leading])
                .shadow(color: withImage ? .black : .clear, radius: 5) //rethink usage when withImage == false
                .fixedSize(horizontal: false, vertical: true)
                .transition(.opacity)
        }.onReceive(imageLoader.$image, perform: { image in
            guard image != nil else {
                return
            }
            withAnimation(.easeInOut(duration: 0.5)) {
                withImage = true
            }
        })
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
