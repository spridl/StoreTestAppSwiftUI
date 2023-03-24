//
//  FlashSale.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 23.03.2023.
//

import Foundation

struct FlashSaleResult: Decodable {
    let flashSale: [FlashSale]
    
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct FlashSale: Decodable, Hashable {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case discount
        case imageUrl = "image_url"
    }
}
