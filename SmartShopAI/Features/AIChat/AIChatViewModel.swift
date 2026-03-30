//
//  AIChatViewModel.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
@MainActor
class AIChatViewModel: ObservableObject {
    @Published var messages: [AIChatMessage] = []
    @Published var input = ""
    @Published var isLoading = false
    private let service = OpenAIService()
    func send() {
        let userMessage = AIChatMessage(text: input, isUser: true)
        messages.append(userMessage)
        let query = input
        input = ""
        isLoading = true
        Task {

            do {

                let response = try await service.sendSemanticRAGQuery(query)

                let aiMessage = AIChatMessage(

                    text: response,

                    isUser: false

                )

                messages.append(aiMessage)

            } catch {

                print("🔥 ERROR:", error)

                let errorMessage = AIChatMessage(

                    text: "Error: \(error.localizedDescription)",

                    isUser: false

                )

                messages.append(errorMessage)

            }

            isLoading = false

        }
         
    }
}
