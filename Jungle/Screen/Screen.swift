//
//  Screen.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct Screen: View {
    var beverages: [Beverage]
    
    var body: some View {
        NavigationView {
            List (beverages) { beverage in
                ScreenRow(beverage: beverage)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(Text("Screen"))
        }
    }
}

struct Screen_Previews: PreviewProvider {
    static var previews: some View {
        Screen(beverages: testBeverages.filter{$0.tapNumber > 0}.sorted{$0.tapNumber < $1.tapNumber})
    }
}
