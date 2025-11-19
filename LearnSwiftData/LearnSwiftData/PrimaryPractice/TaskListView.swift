//
//  CRUDSwiftData.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class TaskItem {
    var id: UUID = UUID()
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}
struct TaskListView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \TaskItem.title) var tasks: [TaskItem]

    @State private var showAdd = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        EditTaskView(task: task)
                    } label: {
                        HStack {
                            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isDone ? .green : .gray)
                            Text(task.title)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(tasks[index])
                    }
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    showAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAdd) {
                AddTaskView()
            }
        }
    }
}

