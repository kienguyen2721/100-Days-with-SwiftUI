//
//  Movie.swift
//  myMovieList
//
//  Created by Nguyễn Trung Kiên on 10/11/25.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let year: Int
    let author: String
    let rating: Double
    let imageName: String
}
