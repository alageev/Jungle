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
                DetailTop(name: food.name, imageId: food.id.uuidString)
                VStack(alignment: .leading) {
                    DetailRow(name: "Weight", value: "\(food.weight)g")
                    DetailRow(name: "Price", value: "\(food.price)₽")
                    if let description = food.description {
                        Text("Description")
                            .padding(.bottom)
                        Text(description)
                            .padding(.trailing)
                    }
                }
                .padding([.top, .leading, .bottom])
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
