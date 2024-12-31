//
//  CoffeeShop.swift
//  CoffeeShops
//
//  Created by Elio Fernandez on 15/12/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct CoffeeShop: Hashable, Codable, Identifiable {
    var name: String
    var id: Int
    var city: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable, Hashable {
        case artisanal = "Artisanal Coffee"
        case signature = "Signature Coffee"
        case specialty = "Specialty Coffee"
    }
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

