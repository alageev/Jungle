//
//  FoodDetail.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct FoodDetail: View {
    
    let food: Food
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                DetailImage(name: food.name, image: food.id.uuidString)
                VStack(alignment: .leading) {
                    DetailRow(name: "Weight", value: "\(food.weight)g")
                    DetailRow(name: "Price", value: "\(food.price)₽")
                    Text("Description")
                        .padding(.bottom)
                    Text(food.description)
                }
                .padding([.leading, .top])
            }
        }
    }
}

struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FoodDetail(food: testFoods[0])
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            FoodDetail(food: testFoods[0])
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewLayout(.sizeThatFits)
            
        }
    }
}
