//
//  FoodRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct FoodRow: View {
    
    @State var isPresented = false
    
    let food: Food
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            VStack(alignment: .leading) {
                Text(food.name)
                    .font(.title3)
                    .foregroundColor(.accentColor)
            }
        }
        .sheet(isPresented: $isPresented, content: {
            FoodDetail(food: food)
        })
    }
}

#if DEBUG
struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: testFoods[0])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
#endif
