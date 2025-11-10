//
//  Actor.swift
//  myMovieList
//
//  Created by Nguyễn Trung Kiên on 10/11/25.
//

import Foundation

struct Actor: Identifiable {
    let id = UUID()
    let name: String
    let debutYear: Int
    let birthYear: Int
    let description: String
    let imageName: String
}
