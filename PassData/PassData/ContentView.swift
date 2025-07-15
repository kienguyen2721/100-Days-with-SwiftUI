//
//  ContentView.swift
//  PassData
//
//  Created by Nguyễn Trung Kiên on 15/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var isNavigate = false
    var body: some View {
        NavigationStack {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            VStack {
                
                TextEditor(text: $text)
                    .padding()
                    .frame(maxHeight: .infinity)
            }
            .padding()
            .navigationBarTitle("First View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SecondView(passedText: text), isActive: $isNavigate) {
                        Button("Done") {
                            isNavigate = true
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
