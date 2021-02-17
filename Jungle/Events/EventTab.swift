//
//  EventTab.swift
//  Jungle
//
//  Created by Алексей Агеев on 16.01.2021.
//

import SwiftUI
import Combine

struct EventTab: View {
    
    @State var selectedEvent: Event?
    
    let events: [Event]
    
    init(_ events: [Event]) {
        self.events = events
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(events) { event in
                    Section {
                        EventView(event, selection: $selectedEvent)
                            .listRowInsets(EdgeInsets())
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Events")
        }
        .sheet(item: $selectedEvent) { event in
            EventsDetail(event: event)
        }
    }
}

#if DEBUG
struct EventTab_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            EventTab(testEvents)
        }
    }
}
#endif
