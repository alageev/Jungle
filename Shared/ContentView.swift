//
//  ContentView.swift
//  Jungle
//
//  Created by Алексей Агеев on 08.09.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 0
    @StateObject var dataLoader = DataLoader()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            BeverageMenu(dataLoader.beverages)
                .tabItem {
                    Image(systemName: selectedTab != 0 ? "cart" : "cart.fill")
                    Text("Beverages")

                }
                .tag(0)
            FoodMenu(dataLoader.food)
                .tabItem {
                    Image(systemName: selectedTab != 1 ? "cart" : "cart.fill")
                    Text("foods_menu")
                }
                .tag(1)
            EventTab(dataLoader.events)
                .tabItem {
                    Image(systemName: selectedTab != 3 ? "ticket" : "ticket.fill")
                    Text("Events")
                }
                .tag(2)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
