//
//  RAGEngine.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

final class RAGEngine {

    private let repo = ProductRepository.shared

    private let embeddingService = EmbeddingService()

    func semanticSearch(query: String) async -> [Product] {

        guard let queryVector = try? await embeddingService.getEmbedding(for: query) else {

            return []

        }

        let scored = repo.products.compactMap { product -> (Product, Double)? in

            guard let vector = product.embedding else { return nil }

            let score = VectorUtils.cosineSimilarity(queryVector, vector)

            return (product, score)

        }

        return scored.sorted { $0.1 > $1.1 }

            .prefix(3)

            .map { $0.0 }

    }

}
 
