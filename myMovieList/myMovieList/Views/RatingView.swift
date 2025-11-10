//
//  RatingView.swift
//  myMovieList
//
//  Created by Nguyễn Trung Kiên on 10/11/25.
//

import Foundation
import SwiftUI

struct RatingView: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { i in
                if Double(i) + 1 <= rating {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                } else if Double(i) + 0.5 <= rating {
                    Image(systemName: "star.leadinghalf.filled").foregroundColor(.yellow)
                } else {
                    Image(systemName: "star").foregroundColor(.gray)
                }
            }
        }
        .font(.caption)
    }
}
