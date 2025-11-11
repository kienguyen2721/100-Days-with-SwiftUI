//
//  InformationView.swift
//  wineResult
//
//  Created by Nguyễn Trung Kiên on 11/11/25.
//

import Foundation
import SwiftUI

struct InformationView: View {
    
    
    var body: some View {
        ZStack {
            // Nền rectangle
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .frame(width: 220, height: 100)
                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)

            // Text giá
            Text("$12.99 - $49.99")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.red)
        }
        .padding()
    }
}
