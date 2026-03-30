//
//  ProductRepository.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
final class ProductRepository {
    static let shared = ProductRepository()
    private(set) var products: [Product] = []
    private init() {
        loadProducts()
    }
    private func loadProducts() {
        guard let url = Bundle.main.url(forResource: "products", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }
        products = (try? JSONDecoder().decode([Product].self, from: data)) ?? []
    }
    func generateEmbeddings() async {
        let service = EmbeddingService()
        for i in products.indices {
            let text = "\(products[i].name) \(products[i].description)"
            if let vector = try? await service.getEmbedding(for: text) {
                products[i].embedding = vector
            }
        }
    }
}
