//
//  AddStudentView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftUI
import SwiftData

struct AddStudentView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Student name", text: $name)
            }
            .navigationTitle("Add Student")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let student = Student(name: name)
                        context.insert(student)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: dismiss.callAsFunction)
                }
            }
        }
    }
}
