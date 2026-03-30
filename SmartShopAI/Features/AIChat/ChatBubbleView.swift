//
//  ChatBubbleView.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import SwiftUI
 
struct ChatBubbleView: View {
    let message: AIChatMessage
    var body: some View {
        HStack {
            if message.isUser { Spacer() }
            Text(message.text)
                .padding()
                .background(message.isUser ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(message.isUser ? .white : .black)
                .cornerRadius(16)
                .frame(maxWidth: 250, alignment: message.isUser ? .trailing : .leading)
            if !message.isUser { Spacer() }
        }
        .padding(.horizontal)
    }
}
