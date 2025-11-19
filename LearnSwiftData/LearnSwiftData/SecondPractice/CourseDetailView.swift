//
//  CourseDetailView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 18/11/25.
//

import Foundation
import SwiftUI
import SwiftData

struct CourseDetailView: View {
    @Environment(\.modelContext) private var context
    @Query var allStudents: [Student]

    var course: Course

    @State private var isAddStudent = false

    var body: some View {
        Form {
//            Section("Students in this course") {
//                if course.students.isEmpty {
//                    Text("No students enrolled")
//                        .foregroundStyle(.secondary)
//                } else {
//                    ForEach(course.students) { student in
//                        Text(student.name)
//                    }
//                }
//            }

            Section("All Students") {
                ForEach(allStudents) { student in
                    HStack {
                        Text(student.name)
                        Spacer()
                        if course.students.contains(student) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleStudent(student)
                    }
                }
            }
        }
        .navigationTitle(course.title)
        .toolbar {
            Button("Add Student") {
                isAddStudent = true
            }
        }
        .sheet(isPresented: $isAddStudent) {
            AddStudentView()
        }
    }

    private func toggleStudent(_ student: Student) {
        if course.students.contains(student) {
            course.students.removeAll { $0.id == student.id }
        } else {
            course.students.append(student)
        }
    }
}

