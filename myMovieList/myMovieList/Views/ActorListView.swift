//
//  ActorListView.swift
//  myMovieList
//
//  Created by Nguyễn Trung Kiên on 5/11/25.
//

import Foundation
import SwiftUI

struct ActorListView: View {
    let actors: [Actor]
    
    var body: some View {
        List(actors) { actor in
            HStack(alignment: .top, spacing: 12) {
                GeometryReader { geo in
                    let width = geo.size.width
                    let height = width * (259 / 194) // Tỷ lệ 194:259
                    
                    Image(actor.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .clipped()
                        .cornerRadius(10)
                }
                .frame(width: 80, height: 80 * (259 / 194)) // đảm bảo giữ tỷ lệ
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(actor.name)
                        .font(.headline)
                    
                    Text("Debut: \(actor.debutYear) | Born: \(actor.birthYear)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(actor.description)
                        .font(.subheadline)
                        .lineLimit(2)
                }
            }
            .padding(.vertical, 8)
        }
        .listStyle(.plain)
    }
}
