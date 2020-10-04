//
//  ScreenRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct ScreenRow: View {
    
    @State var isPresent = false
    
    let beverage: Beverage
    
    var body: some View {
        Button(action: {isPresent.toggle()}){
            HStack {
                VStack(alignment: .leading) {
                    Text(beverage.name)
                    Text(beverage.style)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
//                Text(String(beverage.tapNumber))
//                    .font(.largeTitle)
                Image(systemName: "\(beverage.tapNumber).circle")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
            }
        }
        .sheet(isPresented: $isPresent, content: {
            BeverageDetail(beverage: beverage)
        })
        
    }
}

struct ScreenRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScreenRow(beverage: testBeverages[9])
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .extraSmall)
            ScreenRow(beverage: testBeverages[9])
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}
