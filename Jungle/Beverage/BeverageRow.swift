//
//  BeverageRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct BeverageRow: View {
    
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
                    if let style = beverage.style {
                        Text(style)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                if let tapNumber = beverage.tapNumber {
                    Spacer()
                    Image(systemName: "\(tapNumber).circle.fill")
                        .font(.system(.largeTitle))
                }
            }
        }
        .sheet(isPresented: $isPresented, content: {
            BeverageDetail(beverage: beverage)
        })
        
    }
}
#if DEBUG
struct ScreenRow_Previews: PreviewProvider {
    static var previews: some View {
            Group {
                BeverageRow(beverage: testBeverages[9])
                    .environment(\.sizeCategory, .extraSmall)
                BeverageRow(beverage: testBeverages[9])
                    .environment(\.sizeCategory, .extraExtraExtraLarge)
            }
            .padding([.leading, .trailing])
            .previewLayout(.sizeThatFits)
    }
}
#endif
