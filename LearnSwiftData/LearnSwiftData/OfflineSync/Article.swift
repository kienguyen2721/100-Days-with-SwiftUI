//
//  Article.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 19/11/25.
//

import Foundation

import SwiftData

@Model
class Article {
    @Attribute(.unique) var id: String
    var title: String
    var content: String
    var updatedAt: Date
    
    init(id: String, title: String, content: String, updatedAt: Date) {
        self.id = id
        self.title = title
        self.content = content
        self.updatedAt = updatedAt
    }
}
