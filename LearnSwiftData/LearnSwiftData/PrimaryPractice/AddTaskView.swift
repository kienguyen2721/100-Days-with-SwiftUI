//
//  AddTaskView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftUI
import SwiftData


struct AddTaskView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var title = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Task name", text: $title)
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newTask = TaskItem(title: title)
                        context.insert(newTask)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}


