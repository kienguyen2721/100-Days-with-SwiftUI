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
        ScrollView {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Reference price ")
                            .font(.headline)
                            .foregroundColor(Color(hex: "1F1F1F"))
                            +
                            Text("(Average)")
                            .font(.custom("Onest-Regular", size: 16))
                            .foregroundColor(Color(hex: "717171"))

                        SegmentView()
                            .padding(.horizontal, -16)
                            .frame(height: 60)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Market offers")
                                .font(.headline)
                                .foregroundColor(Color(hex: "1F1F1F"))
                            Spacer()
                            Button(action: {
                                print("See All tapped")
                            }) {
                                Text("See All")
                                    .font(.custom("Onest-Medium", size: 14))
                                    .foregroundColor(Color(hex: "8133F1"))
                            }
                        }
                        
                        EbayView(movies: viewModel.filteredMovies)
                            .frame(height: 200
                            )
                            .padding(.horizontal, -16)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Taste Summary")
                            .font(.headline)
                            .foregroundColor(Color(hex: "1F1F1F"))
                        
                        Text("Juicy red-berry core (wild strawberry, cherry, blackberry) with subtle clove, black pepper and a touch of forest floor; medium-bodied with mouth-watering acidity, soft tannins, and a clean, elegant finish.")
                            .font(.custom("Onest-Regular", size: 16))
                            .foregroundColor(Color(hex: "1F1F1F"))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(12) // 👈 Cách đều 12 mỗi biên (trái, phải, trên, dưới)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                            )
                    }

                    ContentWineView()
                        .padding(0)
                    VStack(alignment: .leading, spacing: 8) {
                        PairView()
                    }
                    Spacer()

                }
                
                .padding(.horizontal, 16)
                // .padding()
            }
        }
       
    }
}

#Preview {
    ContentView()
}
