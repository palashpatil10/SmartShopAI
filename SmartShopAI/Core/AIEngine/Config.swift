//
//  Config.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
enum Config {
    static var apiKey: String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let key = dict["OPENAI_API_KEY"] as? String else {
            fatalError("❌ API Key not found in Config.plist")
        }
        return key
    }
}
