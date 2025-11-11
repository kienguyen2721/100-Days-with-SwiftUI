//
//  ContentView.swift
//  wineResult
//
//  Created by Nguyễn Trung Kiên on 11/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Reference price ")
                        .font(.custom("Onest-Regular", size: 16))
                        .foregroundColor(Color(hexString: "1F1F1F"))
                        +
                        Text("(Average)")
                        .font(.custom("Onest-Regular", size: 16))
                        .foregroundColor(Color(hexString: "717171"))

                    SegmentView()
                        .padding(.horizontal, -16)
                        .frame(height: 60)
                    
                }
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Market offers")
                            .font(.custom("Onest-Regular", size: 16))
                            .foregroundColor(Color(hexString: "1F1F1F"))
                        Spacer()
                        Button(action: {
                            print("See All tapped")
                        }) {
                            Text("See All")
                                .font(.custom("Onest-Medium", size: 14))
                                .foregroundColor(Color(hexString: "8133F1"))
                        }
                    }
                    
                    EbayView(movies: viewModel.filteredMovies)
                        .frame(height: 200
                        )
                        .padding(.horizontal, -16)
                }
                
               
            }
            

            .padding(.horizontal, 16)
            // .padding()  // nếu muốn khoảng cách đều
        }
    }
}

#Preview {
    ContentView()
}
extension Color {
    init(hexString: String) {
        let scanner = Scanner(string: hexString)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}
