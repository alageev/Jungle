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
    
    init (name: String, value: String){
        self.name = LocalizedStringKey(name)
        self.value = value
    }
    
//    init (name: String, value: Int, suffix: String){
//        self.name = LocalizedStringKey(name)
//        self.value = "\(value)" + suffix
//    }
    
    init (name: String, value: Double, suffix: String){
        self.name = LocalizedStringKey(name)
        self.value = String(format: "%.1f", value) + suffix
    }
        
    var body: some View {
        VStack {
            HStack {
                Text(name)
                Spacer()
                Text(value)
            }.padding(.trailing)
            Divider()
        }
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailRow(name: "Volume|Price", value: testBeverages[0].volume[0], suffix: "")
            
            DetailRow(name: "City", value: testBeverages[0].city)
        }
        .padding(.leading)
        .previewLayout(.sizeThatFits)
    }
}
