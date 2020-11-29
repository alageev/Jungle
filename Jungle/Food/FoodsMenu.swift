//
//  FoodsMenu.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct FoodsMenu: View {
    let khachapuris: [Food]
    let pates: [Food]
    let snacks: [Food]
    
    @State var selectedOption = false
    
    init(foods: [Food]) {
        let sortedFoods = foods.sorted { $0.name < $1.name }
        self.khachapuris = sortedFoods.filter { $0.type == .khachapuri }
        self.pates = sortedFoods.filter { $0.type == .pate }
        self.snacks = sortedFoods.filter { $0.type == .snack }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                if khachapuris.count > 0 {
                    Section(header: Text("Khachapuris")) {
                        ForEach(khachapuris) { khachapuri in
                            FoodRow(food: khachapuri)
                        }
                    }
                }
                if pates.count > 0 {
                    Section(header: Text("Pates")) {
                        ForEach(pates) { pate in
                            FoodRow(food: pate)
                        }
                    }
                }
                if snacks.count > 0 {
                    Section(header: Text("Snacks")) {
                        ForEach(snacks) { snack in
                            FoodRow(food: snack)
                        }
                    }
                }
            }
            .navigationTitle(Text("foods_menu"))
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        FoodsMenu(foods: testFoods)
    }
}
