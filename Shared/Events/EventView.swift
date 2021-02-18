//
//  EventView.swift
//  Jungle
//
//  Created by Алексей Агеев on 16.01.2021.
//

import SwiftUI

struct EventView: View {
    
    @Binding var selection: Event?
    @ObservedObject var imageLoader = ImageLoader()
    let event: Event
        
    init (_ event: Event, selection: Binding<Event?>) {
        self.event = event
        self._selection = selection
        imageLoader.loadImage(for: event.id.uuidString)
    }
    
    var body: some View {
        Button(action: selectEvent) {
            VStack(spacing: 0) {
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
                HStack {
                    VStack (alignment: .leading) {
                        Text(event.title)
                            .font(.title)
                            .foregroundColor(.primary)
                            .padding([.leading, .top])
                        Text("\(event.date.day()) \(event.date.month()) \(event.date.year())")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding([.leading, .bottom])
                    }
                    Spacer()
                }
            }
        }
    }
    
    func selectEvent() {
        selection = event
    }
    
}

#if DEBUG
struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(testEvents[0], selection: .constant(testEvents[0]))
            .padding()
            .background(Color(.systemGroupedBackground))
            .previewLayout(.sizeThatFits)
    }
}
#endif
