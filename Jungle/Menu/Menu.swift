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
    
    @State var selectedOption = false
    
    init(beverages: [Beverage], foods: [Food]){
        
        self.beverages = beverages
        self.khachapuris = foods.filter{$0.type == "Khachapuri"}
        self.pates = foods.filter{$0.type == "Pate"}
    }
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Beverages")){
                    ForEach(beverages){ beverage in
//                        Button(action: {
//                            selectedOption.toggle()
//                        }) {
                            BeverageRow(beverage: beverage)
//                                .sheet(isPresented: $selectedOption, content: {
//                                    BeverageDetail(beverage: beverage)
//                                })
//                        }
                    }
                }
                Section(header: Text("Khachapuris")){
                    ForEach(khachapuris){ khachapuri in
//                        Button(action: {
//                            selectedOption.toggle()
//                        }) {
                            FoodRow(food: khachapuri)
//                                .sheet(isPresented: $selectedOption, content: {
//                                    FoodDetail(food: khachapuri)
//                                })
//                        }
                    }
                }
                    
                Section(header: Text("Pates")){
                    ForEach(pates){ pate in
//                        Button(action: {
//                            selectedOption.toggle()
//                        }) {
                            FoodRow(food: pate)
//                                .sheet(isPresented: $selectedOption, content: {
//                                    FoodDetail(food: pate)
//                                })
//                        }
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
