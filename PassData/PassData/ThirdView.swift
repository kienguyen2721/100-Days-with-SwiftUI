//
//  ThirdView.swift
//  PassData
//
//  Created by Nguyễn Trung Kiên on 15/7/25.
//

import Foundation
import SwiftUI


struct ThirdView: View {
    @Binding var text: String
    @State private var inputText: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            TextEditor(text: $inputText)
                .frame(height: 150)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))

            Button("Done") {
                text = inputText
                dismiss()
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Third View")
    }
}
