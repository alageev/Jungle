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
    
    init(event: Event) {
        self.event = event
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                DetailTop(name: event.title, imageId: event.id.uuidString)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Date")
                        Spacer()
                        Text(event.date)
                    }
                    .padding(.trailing)
                    Divider()
                    DescriptionView(event.description)
                }
                .padding([.top, .leading, .bottom])
                .navigationTitle(Text(event.title))
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
