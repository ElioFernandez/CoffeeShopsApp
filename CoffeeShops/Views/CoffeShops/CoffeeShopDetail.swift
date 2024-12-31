//
//  CoffeeShopDetail.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import SwiftUI

struct CoffeeShopDetail: View {
    @Environment(ModelData.self) var modelData
    var coffeeShop: CoffeeShop
    
    var coffeShopIndex: Int {
        modelData.coffeeShops.firstIndex(where: { $0.id == coffeeShop.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: coffeeShop.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: coffeeShop.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(coffeeShop.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.coffeeShops[coffeShopIndex].isFavorite)
                }
                HStack {
                    Text(coffeeShop.city)
                        .font(.subheadline)
                    Spacer()
                    Text(coffeeShop.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About \(coffeeShop.name)")
                    .font(.title2)
                Text(coffeeShop.description)
                    
            }
            .padding()
        }
        .navigationTitle(coffeeShop.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return CoffeeShopDetail(coffeeShop: ModelData().coffeeShops[0])
        .environment(modelData)
}
