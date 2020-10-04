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
                DetailImage(name: beverage.name, imageURL: beverage.imageLink)
                VStack(alignment: .leading) {
                    DetailRow(name: "Style", value: beverage.style)
                    DetailRow(name: "City", value: beverage.city)
                    DetailRow(name: "Brevery", value: beverage.breweryName)
                    DetailRow(name: "ABV", value: beverage.alcohol, suffix: "%")
                    if beverage.bitterness > 0 {
                        DetailRow(name: "IBU", value: "\(beverage.bitterness)")
                    }
                    HStack {
                        Text("Volume|Price")
                        Spacer()
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(beverage.volume[0], specifier: "%.2f")")
                                Text("\(beverage.price[0])₽")
                            }
                            if beverage.volume.count > 1 {
                                HStack {
                                    Text("\(beverage.volume[1], specifier: "%.2f")")
                                    Text("\(beverage.price[1])₽")
                                }
                            }
                        }
                    }.padding(.trailing)
                    Divider()
                    Text("Description")
                        .padding(.bottom)
                    Text(beverage.description)
                }
                .padding([.top, .leading, .bottom])
            }
        }
    }
}

struct BeverageDetail_Previews: PreviewProvider {
    static var previews: some View {
        BeverageDetail(beverage: testBeverages[11])
    }
}
