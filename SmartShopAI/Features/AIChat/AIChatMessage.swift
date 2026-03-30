//
//  AIChatMessage.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
struct AIChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}
