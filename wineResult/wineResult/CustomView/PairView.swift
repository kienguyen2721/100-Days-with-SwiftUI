//
//  PairView.swift
//  wineResult
//
//  Created by Nguyễn Trung Kiên on 11/11/25.
//

import Foundation
import SwiftUI
//
struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}
struct PairView: View {
   
    let ingredients: [Ingredient] = [
            .init(name: "Tomato", imageName: "tomato"),
            .init(name: "Egg", imageName: "egg"),
            .init(name: "Beef", imageName: "beef"),
            .init(name: "Onion", imageName: "greenonion")
        ]
        
        // Cấu hình grid
        let rows = [GridItem(.fixed(28))]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text("Pairs Well With")
                .font(.headline)
                .foregroundColor(Color(hex: "1F1F1F"))
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 8) {
                    ForEach(ingredients) { item in
                        HStack(spacing: 6) {
                            Image(systemName: "photo") // bạn có thể thay bằng item.imageName nếu có asset
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                            
                            Text(item.name)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 8)
                        .frame(height: 28)
                        .background(Color.white) // 🌟 Màu nền trắng
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color(hex: "DBDBDB"), lineWidth: 1)
                        )
                        .cornerRadius(24)
                    }
                }
 //               .padding(.horizontal, 16)
            }
        }
        .frame(height: 60)
          
       }
   }

  

