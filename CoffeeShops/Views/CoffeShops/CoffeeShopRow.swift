//
//  CoffeeShopRow.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import SwiftUI

struct CoffeeShopRow: View {
    var coffeeShop: CoffeeShop
    
    var body: some View {
        HStack {
            coffeeShop.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(coffeeShop.name)
            
            Spacer()
            
            if coffeeShop.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let coffeeShops = ModelData().coffeeShops
    return Group {
        CoffeeShopRow(coffeeShop: coffeeShops[0])
        CoffeeShopRow(coffeeShop: coffeeShops[1])
    }
}
