//
//  EbayView.swift
//  wineResult
//
//  Created by Nguyễn Trung Kiên on 11/11/25.
//

import SwiftUI

struct EbayView: View {
    let movies: [Ebay]
    
    private let itemWidth: CGFloat = 140
    private let posterHeight: CGFloat = 120
    private let infoHeight: CGFloat = 72

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(movies) { movie in
                    VStack(spacing: 0) {
                        // Ảnh poster
                        Image(movie.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: itemWidth, height: posterHeight)
                            .clipped()
                        
                        // View trắng chứa tên + rating
                        VStack(spacing: 4) {
                            Text(movie.name)
                                .font(.headline)
                                .foregroundColor(.black)
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                            
//                            RatingView(rating: movie.rating)
                        }
                        .frame(height: infoHeight)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                    }
                    .frame(width: itemWidth, height: posterHeight + infoHeight)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)
        }
    }
}
