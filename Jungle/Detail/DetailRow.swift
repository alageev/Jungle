//
//  DetailRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 04.10.2020.
//

import SwiftUI

struct DetailRow: View {
    let name: LocalizedStringKey
    let value: String
    
    init (name: String, value: String) {
        self.name = LocalizedStringKey(name)
        self.value = value
    }
    
    init (name: String, value: Double, suffix: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        self.name = LocalizedStringKey(name)
        self.value = numberFormatter.string(from: NSNumber(value: value))! + suffix
    }
        
    var body: some View {
        VStack {
            HStack {
                Text(name)
                Spacer()
                Text(value)
            }
            .padding(.trailing)
            Divider()
        }
    }
}

#if DEBUG
struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DetailRow(name: "City", value: testBeverages[0].city!)
            DetailRow(name: "Alcohol", value: testBeverages[0].alcohol!, suffix: "%")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
