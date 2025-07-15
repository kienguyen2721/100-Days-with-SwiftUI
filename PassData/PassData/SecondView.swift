//
//  SecondView.swift
//  PassData
//
//  Created by Nguyễn Trung Kiên on 15/7/25.
//

import Foundation
import SwiftUI

struct SecondView: View {
    var passedText: String
    @State private var isNavigate = false
    @State private var callBackText: String = ""
    var body: some View {
        NavigationStack {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            VStack {
                Text(callBackText)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            NavigationLink("Go to Third View") {
                ThirdView(text: $callBackText)
            }

            Spacer()
                .padding()
                .navigationTitle("Second View")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
