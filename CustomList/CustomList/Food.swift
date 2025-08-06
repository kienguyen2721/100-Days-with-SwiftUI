//
//  Food.swift
//  CustomList
//
//  Created by Nguyễn Trung Kiên on 6/8/25.
//

import Foundation
import SwiftData

@Model
class Food {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
