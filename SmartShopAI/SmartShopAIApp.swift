//
//  SmartShopAIApp.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import SwiftUI
 
@main
struct SmartShopAIApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .task {
                    await ProductRepository.shared.generateEmbeddings()
                }
        }
    }
}
