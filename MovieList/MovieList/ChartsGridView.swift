//
//  ChartsGridView.swift
//  MovieList
//
//  Created by Nguyễn Trung Kiên on 4/8/25.
//

import Foundation
import SwiftUI

struct ChartsGridView: View {
    let places: [Place]
    // 2 cột để ảnh lớn hơn (giống layout app thật)
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            // Hero Image
            if let first = places.first {
                ZStack(alignment: .bottomLeading) {
                    Image(first.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                    VStack(alignment: .leading) {
                        Text(first.name)
                            .font(.largeTitle).bold()
                            .foregroundColor(.white)
                        Text(first.location)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                    .background(
                        LinearGradient(colors: [Color.black.opacity(0.6), .clear],
                                       startPoint: .bottom,
                                       endPoint: .center)
                    )
                }
            }
            
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(places) { place in
                    VStack(spacing: 8) {
                        Image(place.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 120)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(8)
                            .clipped()
                        Text(place.name)
                            .font(.subheadline)
                            .lineLimit(1)
                            .foregroundColor(.white)   

                            
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
        .background(Color.black.ignoresSafeArea())
    }
}
