//
//  FeatureCard.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 24/12/2024.
//

import SwiftUI

struct FeatureCard: View {
    var coffeeShop: CoffeeShop
    
    var body: some View {
        coffeeShop.featureImage?
            .resizable()
            .overlay {
                TextOverlay(coffeeShop: coffeeShop)
            }
    }
}

struct TextOverlay: View {
    var coffeeShop: CoffeeShop
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.7), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center
        )
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(coffeeShop.name)
                    .font(.title)
                    .bold()
                Text(coffeeShop.city)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(coffeeShop: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
