//
//  MovieGridView.swift
//  myMovieList
//
//  Created by Nguyễn Trung Kiên on 6/11/25.
//
import Foundation
import SwiftUI

struct MovieGridView: View {
    let movies: [Movie]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    
    private let posterRatio: CGFloat = 1060 / 720
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(movies) { movie in
                    VStack(spacing: 8) {
                       
                        GeometryReader { geo in
                            let width = geo.size.width
                            let height = width * posterRatio
                            
                            Image(movie.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: height)
                                .clipped()
                                .cornerRadius(10)
                        }
                        .aspectRatio(720/1060, contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 4) {
                            Text(movie.name)
                                .font(.headline)
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.black)
                        RatingView(rating: movie.rating)
                        }
                        .padding(.horizontal, 4)
                        .padding(.bottom, 8)
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                    )
                }
            }
            .padding()
        }
    }
}
