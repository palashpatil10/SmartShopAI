//
//  Product.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
struct Product: Codable, Identifiable {
    let id: UUID
    let name: String
    let category: String
    let price: Double
    let description: String
    var embedding: [Double]?
}
