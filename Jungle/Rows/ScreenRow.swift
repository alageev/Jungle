//
//  ScreenRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct ScreenRow: View {
    
    @State var isPresented = false
    
    let beverage: Beverage
    
    var body: some View {
        Button(action: {
                isPresented.toggle()
        }) {
            HStack {
                VStack(alignment: .leading) {
                    Text(beverage.name)
                        .font(.title3)
                        .foregroundColor(.accentColor)
                    Text(beverage.style)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "\(beverage.tapNumber).circle.fill")
                    .font(.system(.largeTitle))
            }
        }
        .sheet(isPresented: $isPresented, content: {
            BeverageDetail(beverage: beverage)
        })
        
    }
}

struct ScreenRow_Previews: PreviewProvider {
    static var previews: some View {
            Group {
                ScreenRow(beverage: testBeverages[9])
                    .environment(\.sizeCategory, .extraSmall)
                ScreenRow(beverage: testBeverages[9])
                    .environment(\.sizeCategory, .extraExtraExtraLarge)
            }
            .padding([.leading, .trailing])
            .previewLayout(.sizeThatFits)
    }
}
