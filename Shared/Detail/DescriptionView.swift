//
//  DescriptionView.swift
//  Jungle
//
//  Created by Алексей Агеев on 10.01.2021.
//

import SwiftUI

struct DescriptionView: View {
    
    let description: String
    
    init(_ description: String) {
        self.description = description
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .padding(.bottom)
            Text(description)
                .padding(.trailing)
        }
    }
}

#if DEBUG
struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(testBeverages[3].description!)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
#endif
