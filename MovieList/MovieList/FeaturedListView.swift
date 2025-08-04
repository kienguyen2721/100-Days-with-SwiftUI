//
//  FeaturedListView.swift
//  MovieList
//
//  Created by Nguyễn Trung Kiên on 4/8/25.
//

import Foundation
import SwiftUI


struct FeaturedListView: View {
    let places: [Place]
    
    var body: some View {
        List(places) { place in
            HStack(spacing: 12) {
                Image(place.imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(place.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack(spacing: 2) {
                        ForEach(0..<5) { index in
                            Image(systemName: index < place.rating ? "star.fill" : "star")
                                .foregroundColor(.green)
                        }
                    }.font(.caption)
                }
            }
            .listRowBackground(Color.black)  // nền cell đen
        }
        .scrollContentBackground(.hidden) // ẩn nền List mặc định
        .background(Color.black)
    }
}
