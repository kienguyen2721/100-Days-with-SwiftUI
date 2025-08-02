//
//  ItemModelCell.swift
//  LearnLazyVGrid
//
//  Created by Nguyễn Trung Kiên on 2/8/25.
//

import Foundation
import SwiftUI
struct Item: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var imageName: String
}


struct ItemModelCell: View {
    let item: Item
    let onDelete: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.red)
                        .clipShape(Circle())
                        .padding(4)
                }
            }
            Text(item.name)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(height: 160)
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
