//
//  Model.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Project {
    var name: String

    @Relationship(deleteRule: .cascade)
    var tasks: [Task] = []

    init(name: String) {
        self.name = name
    }
}


@Model
class Task {
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}
