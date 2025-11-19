//
//  AddProjectView.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftUI
import SwiftData

struct AddProjectView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    @State private var name = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Project name", text: $name)
            }
            .navigationTitle("Add Project")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let p = Project(name: name)
                        context.insert(p)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}
