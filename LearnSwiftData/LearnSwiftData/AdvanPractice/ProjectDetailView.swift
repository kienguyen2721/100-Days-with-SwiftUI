//
//  ProjectDetailView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    @Environment(\.modelContext) var context
    @Bindable var project: Project

    @State private var showAdd = false

    var completedCount: Int {
        project.tasks.filter { $0.isDone }.count
    }

    var body: some View {
        List {
            Section {
                Text("Completed: \(completedCount) / \(project.tasks.count)")
            }

            Section("Tasks") {
                ForEach(project.tasks) { task in
                    NavigationLink {
                        EditTaskInProjectView(task: task)
                    } label: {
                        HStack {
                            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                            Text(task.title)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(project.tasks[index])
                    }
                }
            }
        }
        .navigationTitle(project.name)
        .toolbar {
            Button {
                showAdd = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showAdd) {
            AddTaskToProjectView(project: project)
        }
    }
}
