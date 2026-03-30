//
//  EmbeddingResponse.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
struct EmbeddingResponse: Codable {
    let data: [EmbeddingData]
}
 
struct EmbeddingData: Codable {
    let embedding: [Double]
}
