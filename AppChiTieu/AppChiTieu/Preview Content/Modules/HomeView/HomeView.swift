//
//  HomeView.swift
//  AppChiTieu
//
//  Created by Nguyễn Trung Kiên on 29/9/25.
//

import Combine
import Foundation
import SwiftUI

struct HomeView: View {
    // ViewModel

    // Somewhere in my view struct
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        Button(action: {
                            print("Button ảnh được bấm")
                        }) {
                            Image("icon-music")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32) // chỉnh kích thước ảnh
                                .padding(16)
                        }
                    }

                    Image("tet_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(32)
                        .padding(.horizontal, 16)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(height: 60)
                            .cornerRadius(24)

                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.headline)

                        Button(action: {
                            print("Continue pressed")
                        }) {
                            Color.clear // nút trong suốt phủ toàn bộ Rectangle
                        }
                    }
                    .padding(.horizontal, 16)
                    .paddi
                }
                .lineSpacing(24)
                
            }
        }
    }

    // MARK: - Functions
}

// MARK: - Run Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
