//
//  FoodMenu.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct FoodMenu: View {
    let khachapuris: [Food]
    let pates: [Food]
    let snacks: [Food]
    
    @State var selectedFood: Food?
    
    init(_ foods: [Food]) {
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
                            FoodRow(food: khachapuri, selection: $selectedFood)
                        }
                    }
                }
                if pates.count > 0 {
                    Section(header: Text("Pates")) {
                        ForEach(pates) { pate in
                            FoodRow(food: pate, selection: $selectedFood)
                        }
                    }
                }
                if snacks.count > 0 {
                    Section(header: Text("Snacks")) {
                        ForEach(snacks) { snack in
                            FoodRow(food: snack, selection: $selectedFood)
                        }
                    }
                }
            }
            .navigationTitle(Text("foods_menu"))
            .listStyle(InsetGroupedListStyle())
        }
        .sheet(item: $selectedFood) { food in
            FoodDetail(food: food)
        }
    }
}

#if DEBUG
struct FoodMenu_Previews: PreviewProvider {
    static var previews: some View {
        FoodMenu(testFoods)
    }
}
#endif
