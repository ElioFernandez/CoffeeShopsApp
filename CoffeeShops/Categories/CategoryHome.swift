//
//  CategoryHome.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(coffeeShop: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                CategoryFavoriteRow()
                    .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Coffee Shop")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
