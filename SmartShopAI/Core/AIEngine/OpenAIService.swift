//
//  OpenAIService.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
final class OpenAIService {

    private let apiKey = Config.apiKey

    func sendMessage(_ prompt: String) async throws -> String {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = [
            "model": "gpt-4o-mini",
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(OpenAIResponse.self, from: data)
        return response.choices.first?.message.content ?? ""
    }

    func sendSemanticRAGQuery(_ query: String) async throws -> String {
        let rag = RAGEngine()
        let products = await rag.semanticSearch(query: query)
        let context = products.map {
            "\($0.name) ₹\($0.price) - \($0.description)"
        }.joined(separator: "\n")
        
        let prompt = """
        You are a shopping assistant.
        Query: \(query)
        Products:
        \(context)
        Recommend best options.
        """
        return try await sendMessage(prompt)
    }
}
 


