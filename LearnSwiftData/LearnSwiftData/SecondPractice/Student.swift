//
//  Student.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftData
import SwiftUI


@Model
final class Student {
    @Attribute(.unique) var id: UUID
    var name: String

    
    @Relationship var courses: [Course] = []

    init(id: UUID = UUID(), name: String, courses: [Course] = []) {
        self.id = id
        self.name = name
        self.courses = courses
    }
}


