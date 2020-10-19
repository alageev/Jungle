//
//  Menu.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct Menu: View {
    let beverages: [Beverage]
    let khachapuris: [Food]
    let pates: [Food]
    
    @State var selectedOption = 0
    
    init(beverages: [Beverage], foods: [Food]){
        
        self.beverages = beverages
        khachapuris = foods.filter{$0.type == "Khachapuri"}
        pates = foods.filter{$0.type == "Pate"}
        for beverage in beverages {
            let url = URL(string: beverage.imageLink.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
            ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue).load()
        }
        for food in foods {
            let url = URL(string: food.imageLink.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
            ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue).load()
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Beverages")){
                    ForEach(beverages){ beverage in
                        BeverageRow(beverage: beverage)
                    }
                }
                Section(header: Text("Khachapuris")){
                    ForEach(khachapuris){ khachapuri in
                        FoodRow(food: khachapuri)
                    }
                }
                    
                Section(header: Text("Pates")){
                    ForEach(pates){ pate in
                        FoodRow(food: pate)
                    }
                }
            }
            .navigationTitle(Text("Menu"))
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(beverages: testBeverages, foods: testFoods)
    }
}
