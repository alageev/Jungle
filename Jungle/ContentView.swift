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
            BeveragesMenu(beverages: dataLoader.beverages)
                .tabItem {
                    Image(systemName: selectedTab != 0 ? "cart" : "cart.fill")
                    Text("Beverages")
                    
                }
                .tag(0)
            FoodsMenu(foods: dataLoader.foods)
                .tabItem {
                    Image(systemName: selectedTab != 1 ? "cart" : "cart.fill")
                    Text("foods_menu")
                }
                .tag(1)
            Events()
                .tabItem {
                    Image(systemName: selectedTab != 2 ? "cart" : "cart.fill")
                    Text("Events")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
