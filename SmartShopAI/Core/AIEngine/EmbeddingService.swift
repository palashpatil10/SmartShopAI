//
//  EmbeddingService.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
final class EmbeddingService {

    private let apiKey = Config.apiKey
    
    func getEmbedding(for text: String) async throws -> [Double] {
        let url = URL(string: "https://api.openai.com/v1/embeddings")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = [
            "model": "text-embedding-3-small",
            "input": text
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoded = try JSONDecoder().decode(EmbeddingResponse.self, from: data)
        return decoded.data.first?.embedding ?? []
    }
}
