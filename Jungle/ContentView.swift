//
//  ContentView.swift
//  Jungle
//
//  Created by Алексей Агеев on 08.09.2020.
//

import SwiftUI


struct ContentView: View {
    
    @State var selectedTab = 0
    @ObservedObject var beverageLoader = JSONLoader<Beverage>(url: Constants.shared.beverages)
    @ObservedObject var foodsLoader = JSONLoader<Food>(url: Constants.shared.foods)
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Screen(beverages: beverageLoader.data.filter{$0.tapNumber > 0}.sorted{$0.tapNumber < $1.tapNumber})
                .tabItem {
                    Image(systemName: selectedTab != 0 ? "cart" : "cart.fill")
                    Text("Screen")
                    
                }.tag(0)
            Menu(beverages: beverageLoader.data.sorted{$0.name < $1.name}, foods: foodsLoader.data.sorted{$0.name < $1.name})
                .tabItem {
                    Image(systemName: selectedTab != 1 ? "cart" : "cart.fill")
                    Text("Menu")
                    
                }.tag(1)
            Events()
                .tabItem {
                    Image(systemName: selectedTab != 2 ? "cart" : "cart.fill")
                    Text("Events")
                    
                }.tag(2)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
