//
//  ContentView.swift
//  MovieList
//
//  Created by Nguyễn Trung Kiên on 4/8/25.
//

import SwiftUI
struct Place: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let imageName: String
    let rating: Int
}
enum ViewType: String, CaseIterable {
    case list = "Featured"
    case grid = "Charts"
}
struct TopBarView: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Text("Explore")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            
            CustomSegmentView(selectedIndex: $selectedIndex)
                .frame(width: 200) // có thể chỉnh
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 8)
        .background(Color.black)
    }
}

struct CustomSegmentView: View {
    @Binding var selectedIndex: Int
    private let titles = ["Featured", "Charts"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<titles.count, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                }) {
                    Text(titles[index])
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(selectedIndex == index ? Color.green : Color.black)
                        .foregroundColor(selectedIndex == index ? Color.black : Color.green)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.green, lineWidth: 2)
                        )
                }
            }
        }
        .cornerRadius(8)
    }
}

struct ContentView: View {
    @State private var selectedIndex = 0
    let samplePlaces = [
        Place(name: "Kyoto, Japan", location: "Kyoto, Fushimi-ku, Japan", imageName: "test_1", rating: 5),
        Place(name: "Dubai", location: "Dubai, United Arab Emirates", imageName: "test_2", rating: 5),
        Place(name: "Eiffel Tower", location: "Eiffel Tower, Paris, France", imageName: "test_3", rating: 4),
        Place(name: "The Louvre", location: "The Louvre, Paris, France", imageName: "test_4", rating: 5),
        Place(name: "Taj Mahal Mosque", location: "Taj Mahal Mosque, India", imageName: "test_5", rating: 4),
        Place(name: "El Nido, Palawan", location: "El Nido, Palawan Philippines", imageName: "test_6", rating: 5)
    ]
    var body: some View {
            VStack(spacing: 0) {
                TopBarView(selectedIndex: $selectedIndex) // Explore + Segment
                
                if selectedIndex == 0 {
                    FeaturedListView(places: samplePlaces)
                } else {
                    ChartsGridView(places: samplePlaces)
                }
            }
            .background(Color.black.ignoresSafeArea())
            .navigationBarHidden(true)
        }
}


#Preview {
    ContentView()
}
