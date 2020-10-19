//
//  DetailImage.swift
//  Jungle
//
//  Created by Алексей Агеев on 04.10.2020.
//

import SwiftUI

struct DetailImage: View {
    let name: String
    let imageURL: String
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            URLImage(url: imageURL)
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
        DetailImage(name: testBeverages[0].name, imageURL: testBeverages[0].imageLink)
            .previewLayout(.sizeThatFits)
    }
}
