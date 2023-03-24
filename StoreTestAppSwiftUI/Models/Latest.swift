//
//  Latest.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 22.03.2023.
//

import Foundation

struct Result: Decodable {
    let latest: [Latest]
}

struct Latest: Decodable, Hashable {
    let category: String
    let name: String
    let price: Int
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case imageUrl = "image_url"
    }
    
}
