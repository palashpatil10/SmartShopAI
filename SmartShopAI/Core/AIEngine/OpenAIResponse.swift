//
//  OpenAIResponse.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
struct OpenAIResponse: Codable {
    let choices: [Choice]
}
 
struct Choice: Codable {
    let message: Message
}
 
struct Message: Codable {
    let role: String
    let content: String
}
