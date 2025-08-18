//
//  ArticleView.swift
//  CustomListAndHeader
//
//  Created by Nguyễn Trung Kiên on 18/8/25.
//

import Foundation
import SwiftUI

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
}
struct ArticleView: View {
    @State private var selectedCategory = "M.T.G Cards"
    
    let categories = ["M.T.G Cards", "Poke Cards", "Y.G.O Cards", "D.B Cards"]
    
    let cards: [Card] = [
        Card(image: "dbz", title: "The Best Energy Cards in Magic...", subtitle: "What are the best Energy cards in Magic: The Gathering, and why are so..."),
        Card(image: "dbz", title: "The Best Energy Cards in Magic...", subtitle: "What are the best Energy cards in Magic: The Gathering, and why are so..."),
        Card(image: "dbz", title: "The Best Energy Cards in Magic...", subtitle: "What are the best Energy cards in Magic: The Gathering, and why are so..."),
        Card(image: "dbz", title: "The Best Energy Cards in Magic...", subtitle: "What are the best Energy cards in Magic: The Gathering, and why are so...")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title
            Text("Articles")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            
            // Header categories (cách title 12px)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == category ? Color.red.opacity(0.8) : Color.gray.opacity(0.3))
                            )
                            .foregroundColor(selectedCategory == category ? .white : .primary)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12) // 👈 cách title 12px
            }
            
            // List of cards (cách header categories 24px)
            LazyVStack(spacing: 12) {
                ForEach(cards) { card in
                    HStack(spacing: 12) {
                        Image(card.image)
                            .resizable()
                            .frame(width: 78, height: 103)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(card.title)
                                .font(.headline)
                                .lineLimit(1)
                                .foregroundColor(.white)
                            Text(card.subtitle)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 39/255, green: 34/255, blue: 33/255)) // #272221
                    .cornerRadius(26)
                    .padding(.horizontal)
                    .frame(height: 115)
                }
            }
            .padding(.top, 24) // 👈 cách header 24px
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
