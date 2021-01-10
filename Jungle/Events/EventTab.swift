//
//  EventsTab.swift
//  Jungle
//
//  Created by Алексей Агеев on 28.09.2020.
//

import SwiftUI

struct EventsTab: View {
//    let events: [Event]
    let upcomingEvents: [Event]?
    let pastEvents: [Event]?
    
    init(_ events: [Event]) {
        let sortedEvents = events.sorted(by: { $0.date > $1.date })
        upcomingEvents = sortedEvents.filter({$0.date > Date()})
        pastEvents = sortedEvents.filter({$0.date < Date()})
    }
    
    var body: some View {
        NavigationView {
            List {
                if let upcomingEvents = upcomingEvents {
                    Section(header: Text("upcoming_events")) {
                        if upcomingEvents.count > 0 {
                            ForEach (upcomingEvents) { event in
                                EventRow(event: event)
                            }
                        } else {
                            HStack {
                                Spacer()
                                Text("Упc… мы пока что ничего не придумали")
                                    .multilineTextAlignment(.center)
                                    .font(.title3)
                                    .foregroundColor(.accentColor)
                                Spacer()
                            }
                        }
                    }
                }
                if let pastEvents = pastEvents {
                    Section(header: Text("past_events")) {
                        ForEach (pastEvents) { event in
                            EventRow(event: event)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Events")
        }
    }
}

#if DEBUG
struct Events_Previews: PreviewProvider {
    static var previews: some View {
        EventsTab(testEvents)
        
    }
}
#endif
