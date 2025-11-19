//
//  ContentView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 14/11/25.
//

import SwiftUI

import SwiftUI
import SwiftData



struct ContentView: View {
    @Query var students: [Student]
    @Environment(\.modelContext) private var context

    @State private var isAddStudent = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(students) { student in
                    NavigationLink {
                        StudentDetailView(student: student)
                    } label: {
                        HStack {
                            Text(student.name)
                            Spacer()
                            Text("\(student.courses.count) courses")
                                .foregroundStyle(.secondary)
                                .font(.caption)
                        }
                    }
                }
                .onDelete { offsets in
                    offsets.map { students[$0] }.forEach(context.delete)
                }
            }

            .navigationTitle("Students")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink("Courses") {
                        CourseListView()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        isAddStudent = true
                    }
                }
            }
            .sheet(isPresented: $isAddStudent) {
                AddStudentView()
            }
        }
    }
}

