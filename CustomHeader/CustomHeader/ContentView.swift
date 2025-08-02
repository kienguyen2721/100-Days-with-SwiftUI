//
//  ContentView.swift
//  CustomHeader
//
//  Created by Nguyễn Trung Kiên on 2/8/25.
//

import SwiftUI



struct ContentView: View {
    let movies: [Movie] = [
        Movie(name: "Inception", color: .blue),
        Movie(name: "La La Land", color: .yellow),
        Movie(name: "The Dark Knight", color: .gray),
        Movie(name: "Interstellar", color: .purple)
    ]
    
    var body: some View {
        List {
            Section(header: MovieHeaderView()) {
                ForEach(movies) { movie in
                    HStack(spacing: 26) {
                        Circle()
                            .fill(movie.color)
                            .frame(width: 24, height: 24)
                        Text(movie.name)
                            .font(.headline)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}
#Preview {
    ContentView()
}
