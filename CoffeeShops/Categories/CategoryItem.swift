//
//  CategoryItem.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import SwiftUI

struct CategoryItem: View {
    var coffeeShop: CoffeeShop
    
    var body: some View {
        VStack(alignment: .leading) {
            coffeeShop.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 160, height: 160)
                .cornerRadius(6)
            Text(coffeeShop.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 16)
    }
}

#Preview {
    CategoryItem(coffeeShop: ModelData().coffeeShops[0])
}
