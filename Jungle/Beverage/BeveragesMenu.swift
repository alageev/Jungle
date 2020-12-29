//
//  BeveragesMenu.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct BeveragesMenu: View {
    
    let tapBeverages: [Beverage]
    let alcoholicBeverages: [Beverage]
    let nonAlcoholicBeverages: [Beverage]
    
    init(beverages: [Beverage]) {
        tapBeverages = beverages.filter { $0.tapNumber != nil }.sorted { $0.tapNumber! < $1.tapNumber! }
        let notTapBeverages = beverages.filter { $0.tapNumber == nil }.sorted { $0.name < $1.name }
        alcoholicBeverages = notTapBeverages.filter { $0.alcohol != nil }
        nonAlcoholicBeverages = notTapBeverages.filter { $0.alcohol == nil }.sorted { $0.style ?? " " < $1.style ?? " "}
    }
    
    var body: some View {
        NavigationView {
            List {
                if tapBeverages.count > 0 {
                    Section(header: Text("beverages_on_taps")) {
                        ForEach(tapBeverages) { beverage in
                            BeverageRow(beverage: beverage)
                        }
                    }
                }
                if alcoholicBeverages.count > 0 {
                    Section(header: Text("alcoholic_beverages")) {
                        ForEach(alcoholicBeverages) { beverage in
                            BeverageRow(beverage: beverage)
                        }
                    }
                }
                if nonAlcoholicBeverages.count > 0 {
                    Section(header: Text("soft_drinks")) {
                        ForEach(nonAlcoholicBeverages) { beverage in
                            BeverageRow(beverage: beverage)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(Text("Beverages"))
        }
    }
}

struct Screen_Previews: PreviewProvider {
    static var previews: some View {
        BeveragesMenu(beverages: testBeverages)
    }
}
