//
//  BeverageRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 26.09.2020.
//

import SwiftUI

struct BeverageRow: View {
	
	@State var isPresented = false
	
	let beverage: Beverage
	
	var body: some View {
		Button(action: {
			isPresented.toggle()
		}) {
			VStack(alignment: .leading) {
				Text(beverage.name)
					.font(.title3)
					.foregroundColor(.accentColor)
				Text(beverage.style)
					.font(.subheadline)
					.foregroundColor(.secondary)
			}
		}
		.sheet(isPresented: $isPresented, content: {
			BeverageDetail(beverage: beverage)
		})
	}
}

struct BeverageRow_Previews: PreviewProvider {
	static var previews: some View {
		BeverageRow(beverage: testBeverages[9])
			.padding([.leading, .trailing])
			.previewLayout(.sizeThatFits)
	}
}
