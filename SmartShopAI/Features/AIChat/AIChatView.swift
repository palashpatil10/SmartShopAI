//
//  AIChatView.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import SwiftUI
 
struct AIChatView: View {
    @StateObject var vm = AIChatViewModel()
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(vm.messages) { message in
                            ChatBubbleView(message: message)
                                .id(message.id)
                        }
                        if vm.isLoading {
                            ProgressView()
                                .padding()
                        }
                    }
                }
                .onChange(of: vm.messages.count) { _ in
                    if let last = vm.messages.last {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }
            inputBar
        }
        .navigationTitle("AI Assistant")
    }
    private var inputBar: some View {
        HStack {
            TextField("Ask for products...", text: $vm.input)
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            Button(action: vm.send) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}
