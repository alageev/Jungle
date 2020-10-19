//
//  BeverageRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct BeverageRow: View {
    
    @State var isPresent = false
    
    let beverage: Beverage
    
    var body: some View {
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
        }
        .contentShape(Rectangle())
        .onTapGesture {isPresent.toggle()}
        .sheet(isPresented: $isPresent, content: {
            BeverageDetail(beverage: beverage)
        })
    }
}

struct BeverageRow_Previews: PreviewProvider {
    static var previews: some View {
        BeverageRow(beverage: testBeverages[9])
            .padding(.leading)
            .previewLayout(.sizeThatFits)
    }
}
