//
//  CategoryFavoriteItem.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 31/12/2024.
//

import SwiftUI

struct CategoryFavoriteItem: View {
    var coffeeShop: CoffeeShop
    
    var body: some View {
        VStack(alignment: .leading) {
            coffeeShop.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 160, height: 160)
                .clipShape(Circle())
            
            Text(coffeeShop.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 16)
    }
}

#Preview {
    CategoryFavoriteItem(coffeeShop: ModelData().coffeeShops[0])
}
