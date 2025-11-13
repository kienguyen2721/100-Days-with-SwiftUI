//
//  MainInformationView.swift
//  wineResult
//
//  Created by Nguyễn Trung Kiên on 13/11/25.
//

import Foundation
import SwiftUI

struct MainInformationView: View {
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
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Vintage List")
                                .font(.headline)
                                .foregroundColor(Color(hex: "1F1F1F"))
                            
                        
                        
                        OtherVintagesView(items: [
                            VintageDetail(name: "Penfolds St Henri Shiraz", year: 2018, ratings_average: 4.8, type: "Red"),
                            VintageDetail(name: "Château Margaux", year: 2020, ratings_average: 4.6, type: "Red"),
                            VintageDetail(name: "Dom Pérignon Vintage", year: 2012, ratings_average: 4.9, type: "White"),
                            VintageDetail(name: "Cloudy Bay Sauvignon Blanc", year: 2021, ratings_average: 4.5, type: "White"),
                            VintageDetail(name: "Veuve Clicquot Brut", year: 2015, ratings_average: 4.7, type: "White"),
                            VintageDetail(name: "Opus One Napa Valley", year: 2019, ratings_average: 4.8, type: "Red"),
                            VintageDetail(name: "Antinori Tignanello", year: 2020, ratings_average: 4.6, type: "Red"),
                            VintageDetail(name: "Chablis Premier Cru", year: 2018, ratings_average: 4.4, type: "White"),
                            VintageDetail(name: "Moët & Chandon Imperial", year: 2016, ratings_average: 4.7, type: "Red"),
                            VintageDetail(name: "Riesling Dr. Loosen", year: 2022, ratings_average: 4.3, type: "White")
                        ])
                            .padding(.horizontal, -16)
                        
                        Spacer()
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
    MainInformationView()
}
