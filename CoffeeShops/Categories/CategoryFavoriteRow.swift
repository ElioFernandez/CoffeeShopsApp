//
//  CategoryFavoriteRow.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 31/12/2024.
//

import SwiftUI

struct CategoryFavoriteRow: View {
    @Environment(ModelData.self) var modelData
    
    var filteredCoffeeShops: [CoffeeShop] {
        modelData.coffeeShops.filter { coffeeShop in
            coffeeShop.isFavorite
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorites")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(filteredCoffeeShops) { coffeeShop in
                        NavigationLink {
                            CoffeeShopDetail(coffeeShop: coffeeShop)
                        } label: {
                            CategoryFavoriteItem(coffeeShop: coffeeShop)
                        }
                    }
                    
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    CategoryFavoriteRow()
        .environment(ModelData())
}
