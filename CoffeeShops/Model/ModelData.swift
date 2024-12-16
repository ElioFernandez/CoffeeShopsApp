//
//  ModelData.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import Foundation

@Observable
class ModelData {
    var coffeeShops: [CoffeeShop] = load("coffee_shops.json")
    
    var features: [CoffeeShop] {
        coffeeShops.filter { $0.isFeatured }
    }
    
    var categories: [String: [CoffeeShop]] {
        Dictionary(
            grouping: coffeeShops,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \(error)")
    }
}
