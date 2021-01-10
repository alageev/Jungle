//
//  EventRow.swift
//  Jungle
//
//  Created by Алексей Агеев on 10.01.2021.
//

import SwiftUI

struct EventRow: View {
    
    @State var isPresented = false
    
    let event: Event
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title3)
                    .foregroundColor(.accentColor)
                Text("\(event.date.day()) \(event.date.month()) \(event.date.year())")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .sheet(isPresented: $isPresented, content: {
            EventsDetail(event: event)
        })
    }
}

#if DEBUG
struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: testEvents[0])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
#endif
