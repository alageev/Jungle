//
//  BeverageRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct BeverageRow: View {
    let beverage: Beverage
    
    @Binding var selection: Beverage?
    
    var body: some View {
        Button(action: selectBeverage) {
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
    }
    
    func selectBeverage() {
        selection = beverage
    }
}

#if DEBUG
struct ScreenRow_Previews: PreviewProvider {
    static var previews: some View {
        BeverageRow(beverage: testBeverages[9], selection: .constant(testBeverages[0]))
            .environment(\.sizeCategory, .extraSmall)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
#endif
