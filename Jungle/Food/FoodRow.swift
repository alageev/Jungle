//
//  FoodRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct FoodRow: View {
    let food: Food
    
    @Binding var selection: Food?
    
    var body: some View {
        Button(action: selectFood) {
            VStack(alignment: .leading) {
                Text(food.name)
                    .font(.title3)
                    .foregroundColor(.accentColor)
            }
        }
    }
    
    func selectFood() {
        selection = food
    }
}

#if DEBUG
struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: testFoods[0], selection: .constant(testFoods[0]))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
#endif
