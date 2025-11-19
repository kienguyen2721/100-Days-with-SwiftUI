//
//  EditTaskView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftUI
import SwiftData


struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var task: TaskItem

    var body: some View {
        Form {
            TextField("Title", text: $task.title)
            Toggle("Completed", isOn: $task.isDone)
        }
        .navigationTitle("Edit Task")
        .toolbar {
            Button("Done") {
                dismiss() // @Bindable tự động update
            }
        }
    }
}
