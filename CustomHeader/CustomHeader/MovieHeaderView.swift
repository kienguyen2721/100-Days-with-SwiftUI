
//
//  Moview.swift
//  CustomHeader
//
//  Created by Nguyễn Trung Kiên on 2/8/25.
//
import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}
struct MovieHeaderView: View {
    let images = ["test_1", "test_2", "test_3", "test_4","test_1", "test_2", "test_3", "test_4"]
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(Array(images.enumerated()), id: \.offset) { index, imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)  // full chiều ngang
                    .frame(height: 250)          // tuỳ chỉnh chiều cao
                    .clipped()
                    .tag(index)
            }
        }
        .frame(height: 200)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .automatic))
        .padding(.bottom, 24)
        .cornerRadius(24)
    }
}

