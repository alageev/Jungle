//
//  BeverageDetail.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct BeverageDetail: View {
    
    let beverage: Beverage
    let numberFormatter = NumberFormatter()
    
    init(_ beverage: Beverage) {
        self.beverage = beverage
        numberFormatter.usesSignificantDigits = true
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                DetailTop(name: beverage.name, imageId: beverage.id.uuidString)
                VStack(alignment: .leading) {
                    if let style = beverage.style {
                        DetailRow(name: "Style", value: style)
                    }
                    if let city = beverage.city {
                        DetailRow(name: "City", value: city)
                    }
                    if let breweryName = beverage.breweryName {
                        DetailRow(name: "Brewery", value: breweryName)
                    }
                    if let alcohol = beverage.alcohol {
                        DetailRow(name: "ABV", value: alcohol, suffix: "%")
                    }
                    if let bitterness = beverage.bitterness {
                        DetailRow(name: "IBU", value: "\(bitterness)")
                    }
                    if let volume = beverage.volume,
                       let price = beverage.price {
                        HStack {
                            Text("Volume|Price")
                            Spacer()
                            HStack {
                                VStack(alignment: .leading) {
                                    ForEach (volume, id: \.self) { volume in
                                        Text(numberFormatter.string(from: NSNumber(value: volume)) ?? "")
                                    }
                                }
                                
                                VStack(alignment: .trailing) {
                                    ForEach (price, id: \.self) { price in
                                        Text("\(price)₽")
                                    }
                                }
                                
                            }
                        }
                        .padding(.trailing)
                        Divider()
                    }
                    if let description = beverage.description {
                        DescriptionView(description)
                    }
                }
                .padding([.top, .leading, .bottom])
            }
        }
    }
}

#if DEBUG
struct BeverageDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BeverageDetail(testBeverages[11])
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            BeverageDetail(testBeverages[11])
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
#endif
