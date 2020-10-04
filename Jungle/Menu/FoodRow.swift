//
//  FoodRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct FoodRow: View {
    
    @State var isPresent = false
    
    let food: Food
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.name)
                Text(food.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {isPresent.toggle()}
        .sheet(isPresented: $isPresent, content: {
            FoodDetail(food: food)
        })
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: testFoods[0])
    }
}
