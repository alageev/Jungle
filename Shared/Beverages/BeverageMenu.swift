//
//  BeverageMenu.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct BeverageMenu: View {
    
    @State var selectedBeverage: Beverage?
    
    let tapBeverages: [Beverage]
    let alcoholicBeverages: [Beverage]
    let nonAlcoholicBeverages: [Beverage]
    
    init(_ beverages: [Beverage]) {
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
                            BeverageRow(beverage: beverage, selection: $selectedBeverage)
                        }
                    }
                }
                if alcoholicBeverages.count > 0 {
                    Section(header: Text("alcoholic_beverages")) {
                        ForEach(alcoholicBeverages) { beverage in
                            BeverageRow(beverage: beverage, selection: $selectedBeverage)
                        }
                    }
                }
                if nonAlcoholicBeverages.count > 0 {
                    Section(header: Text("soft_drinks")) {
                        ForEach(nonAlcoholicBeverages) { beverage in
                            BeverageRow(beverage: beverage, selection: $selectedBeverage)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .sheet(item: $selectedBeverage) { beverage in
                BeverageDetail(beverage)
            }
            .navigationTitle(Text("Beverages"))
        }
    }
}

#if DEBUG
struct BeverageMenu_Previews: PreviewProvider {
    static var previews: some View {
        BeverageMenu(testBeverages)
    }
}
#endif
