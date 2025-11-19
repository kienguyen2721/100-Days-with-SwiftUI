//
//  Course.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftData
import SwiftUI
import Foundation


@Model
final class Course {
    @Attribute(.unique) var id: UUID
    var title: String

    
    @Relationship(inverse: \Student.courses)
    var students: [Student] = []

    init(id: UUID = UUID(), title: String, students: [Student] = []) {
        self.id = id
        self.title = title
        self.students = students
    }
}
