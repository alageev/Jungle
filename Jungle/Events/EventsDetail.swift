//
//  EventsDetail.swift
//  Jungle
//
//  Created by Алексей Агеев on 10.01.2021.
//

import SwiftUI

struct EventsDetail: View {
//    @ObservedObject var imageLoader = ImageLoader()
    let event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                DetailTop(name: event.title, imageId: event.id.uuidString)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Date")
                        Spacer()
                        Text(event.date.day())
                        Text(event.date.month())
                        Text(event.date.year())
                    }
                    .padding(.trailing)
                    Divider()
                    DescriptionView(event.description)
                }
                .padding([.top, .leading, .bottom])
            }
        }
    }
}

#if DEBUG
struct EventsDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventsDetail(event: testEvents[0])
    }
}
#endif
