//
//  CustomNavBar.swift
//  CustomListAndHeader
//
//  Created by Nguyễn Trung Kiên on 18/8/25.
//
import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        HStack {
            // Nút bên trái
            Button(action: {
                print("mini_menu tapped")
            }) {
                Image("mini_menu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            
            Spacer()
            
            // Tiêu đề ở giữa
            HStack(spacing: 0) {
                Text("Card Game ")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Text("Scanner")
                    .foregroundColor(.red)
                    .font(.headline)
            }
            
            Spacer()
            
            // Nút bên phải
            Button(action: {
                print("icon_pro tapped")
            }) {
                Image("icon_pro")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 24) // chỉnh kích thước phù hợp
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
        .padding(.bottom, 8)
        .background(Color.black)
    }
}
