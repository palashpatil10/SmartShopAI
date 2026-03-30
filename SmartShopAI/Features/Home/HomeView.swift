//
//  HomeView.swift
//  SmartShopAI
//
//  Created by CapG on 28/03/26.
//

import SwiftUI
 
struct HomeView: View {

    var body: some View {

        NavigationView {

            VStack(spacing: 30) {

                Text("SmartShop AI")

                    .font(.largeTitle)

                    .bold()

                Text("Your AI Shopping Assistant")

                    .foregroundColor(.gray)

                NavigationLink {

                    AIChatView()

                } label: {

                    Text("Start Shopping")

                        .foregroundColor(.white)

                        .padding()

                        .frame(maxWidth: .infinity)

                        .background(Color.blue)

                        .cornerRadius(12)

                        .padding(.horizontal)

                }

                Spacer()

            }

            .padding()

        }

    }

}
 
