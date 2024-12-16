//
//  ContentView.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "rosette")
                }
                .tag(Tab.featured)
            
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
