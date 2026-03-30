//
//  ProductCardView.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import SwiftUI
 
struct ProductCardView: View {

    let product: Product

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Rectangle()

                .fill(Color.gray.opacity(0.2))

                .frame(height: 120)

                .overlay(Text("Image"))

            Text(product.name)

                .font(.headline)

            Text("₹\(Int(product.price))")

                .font(.subheadline)

                .foregroundColor(.green)

            Text(product.description)

                .font(.caption)

                .foregroundColor(.gray)

                .lineLimit(2)

        }

        .padding()

        .background(Color.white)

        .cornerRadius(16)

        .shadow(radius: 3)

    }

}
 
