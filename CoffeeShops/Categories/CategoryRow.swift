//
//  CategoryRow.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [CoffeeShop]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { coffeeShop in
                        NavigationLink {
                            CoffeeShopDetail(coffeeShop: coffeeShop)
                        } label: {
                            CategoryItem(coffeeShop: coffeeShop)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let coffeeShops = ModelData().coffeeShops
    return CategoryRow(
        categoryName: coffeeShops[0].category.rawValue,
        items: Array(coffeeShops.prefix(4))
    )
}
