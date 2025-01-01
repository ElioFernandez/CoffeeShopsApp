//
//  ContentView.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .top
    
    enum Tab {
        case top
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Top Cafés", systemImage: "rosette")
                }
                .tag(Tab.top)
            
            CoffeeShopList()
                .tabItem {
                    Label("List", systemImage: "line.3.horizontal")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
