//
//  VectorUtils.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import Foundation
 
struct VectorUtils {
    static func cosineSimilarity(_ a: [Double], _ b: [Double]) -> Double {
        let dot = zip(a, b).map(*).reduce(0, +)
        let magA = sqrt(a.map { $0*$0 }.reduce(0,+))
        let magB = sqrt(b.map { $0*$0 }.reduce(0,+))
        return dot / (magA * magB + 1e-10)
    }
}
