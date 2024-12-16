//
//  CoffeeShopList.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import SwiftUI

struct CoffeeShopList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = true
    
    var filteredCoffeeShops: [CoffeeShop] {
        modelData.coffeeShops.filter { coffeeShop in
            (!showFavoritesOnly || coffeeShop.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredCoffeeShops) { coffeeShop in
                    NavigationLink {
                        CoffeeShopDetail(coffeeShop: coffeeShop)
                    } label: {
                        CoffeeShopRow(coffeeShop: coffeeShop)
                    }
                }
            }
            .animation(.default, value: filteredCoffeeShops)
            .navigationTitle("Coffee Shops")
        } detail: {
            Text("Select a Coffee shop")
        }
    }
}

#Preview {
    CoffeeShopList()
        .environment(ModelData())
}
