//
//  MainScreen.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct MainScreen: View {
    var beverages: [Beverage]
    
    var body: some View {
        NavigationView {
            List (beverages) { beverage in
                ScreenRow(beverage: beverage)
            }
            .navigationTitle(Text("Screen"))
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(beverages: testBeverages.filter{$0.tapNumber > 0}.sorted{$0.tapNumber < $1.tapNumber})
    }
}
