//
//  BeverageDetail.swift
//  Jungle
//
//  Created by Алексей Агеев on 25.09.2020.
//

import SwiftUI

struct BeverageDetail: View {
    
    let beverage: Beverage
    
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
                    if let volume = beverage.volume {
                        HStack {
                            Text("Volume|Price")
                            Spacer()
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(volume[0], specifier: "%.2f")")
                                    Text("\(beverage.price[0])₽")
                                }
                                if volume.count > 1 {
                                    HStack {
                                        Text("\(volume[1], specifier: "%.2f")")
                                        Text("\(beverage.price[1])₽")
                                    }
                                }
                            }
                        }
                        .padding(.trailing)
                    } else {
                        DetailRow(name: "Price", value: "\(beverage.price[0])")
                    }
                    if let description = beverage.description {
                        Divider()
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
#if DEBUG
struct BeverageDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BeverageDetail(beverage: testBeverages[11])
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            BeverageDetail(beverage: testBeverages[11])
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
#endif
