//
//  StudentDetailView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftUI
import SwiftData
struct StudentDetailView: View {
    @Environment(\.modelContext) private var context
    @Query var allCourses: [Course]

    var student: Student

    @State private var isAddCourse = false

    var body: some View {
        Form {
            Section("Enrolled Courses") {
                if student.courses.isEmpty {
                    Text("No courses yet")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(student.courses) { course in
                        Text(course.title)
                    }
                }
            }

            Section("All Courses") {
                ForEach(allCourses) { course in
                    HStack {
                        Text(course.title)
                        Spacer()
                        if student.courses.contains(course) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleCourse(course)
                    }
                }
            }
        }
        .navigationTitle(student.name)
        .toolbar {
            Button("Add Course") {
                isAddCourse = true
            }
        }
        .sheet(isPresented: $isAddCourse) {
            AddCourseView()
        }
    }

    private func toggleCourse(_ course: Course) {
        if student.courses.contains(course) {
            student.courses.removeAll { $0.id == course.id }
        } else {
            student.courses.append(course)
        }
    }
}
