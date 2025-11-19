//
//  CourseListView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 18/11/25.
//

import Foundation
import SwiftUI
import SwiftData
struct CourseListView: View {
    @Environment(\.modelContext) private var context
    @Query var courses: [Course]

    @State private var isAddCourse = false

    var body: some View {
        List {
            ForEach(courses) { course in
                NavigationLink {
                    CourseDetailView(course: course)
                } label: {
                    HStack {
                        Text(course.title)
                        Spacer()
                        Text("\(course.students.count) students")
                            .foregroundStyle(.secondary)
                            .font(.caption)
                    }
                }
            }
            .onDelete { offsets in
                offsets.map { courses[$0] }.forEach(context.delete)
            }
        }

        .navigationTitle("Courses")
        .toolbar {
            Button("Add") { isAddCourse = true }
        }
        .sheet(isPresented: $isAddCourse) {
            AddCourseView()
        }
    }
}

