//
//  ContentWineView.swift
//  wineResult
//
//  Created by Nguyễn Trung Kiên on 11/11/25.
//
import SwiftUI


struct ContentWineView: View {
    let allDetails: [DetailWine] = [
        .init(title: "Grape Varietal", value: "Merlot", iconName: nil),
        .init(title: "Country", value: "🇺🇸 United States", iconName: nil),
        .init(title: "Type", value: "Red Wine", iconName: nil),
        .init(title: "Winery", value: "Duckhorn", iconName: nil),
        .init(title: "Region name", value: "Napa Valley", iconName: nil),
        .init(title: "Year", value: "2022", iconName: nil),
        .init(title: "Vintage", value: "1954-2021", iconName: nil),
        .init(title: "Website", value: "http://www.duckhorn.com", iconName: nil),
        .init(title: "ABV", value: "14.5%", iconName: nil),
        .init(title: "Acidity", value: "High", iconName: nil),
        .init(title: "Body", value: "Full-bodied", iconName: nil),
        .init(title: "Elaborate", value: "Varietal/100%", iconName: nil),
        .init(title: "Feature", value: "Collectibles, Boutique, Cooking Ingredient, Home use, bar & restaurant use", iconName: "wineglass")
    ]
    
    @State private var showAll = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Details")
                .font(.headline)
//                .padding(.horizontal)
            
            VStack(spacing: 0) {
                LazyVStack(spacing: 0) {
                    ForEach(showAll ? allDetails : Array(allDetails.prefix(5))) { item in
                        rowView(for: item)
                        Divider().padding(.leading)
                    }
                    
                    // Nút nằm trong collection
                    Button(action: {
                        withAnimation(.easeInOut) { showAll.toggle() }
                    }) {
                        HStack {
                            Spacer()
                            Text(showAll ? "See less" : "See more")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                            Image(systemName: showAll ? "chevron.up" : "chevron.down")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .padding(.vertical, 12)
                    }
                }
            }
           
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(hex: "DBDBDB"), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
//            .padding(.horizontal)
        }
        .background(Color(.clear))
        .animation(.easeInOut, value: showAll)
    }
    
    // MARK: - Row View
    @ViewBuilder
    private func rowView(for item: DetailWine) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(item.title)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .frame(width: 120, alignment: .leading)
            
            HStack(alignment: .top, spacing: 6) {
                if let icon = item.iconName {
                    Image(systemName: icon)
                        .foregroundColor(.purple)
                }
                
                // Nếu là link thì hiển thị màu đỏ và có thể nhấn
                if item.value.lowercased().hasPrefix("http") {
                    Link(destination: URL(string: item.value)!) {
                        Text(item.value)
                            .font(.system(size: 15))
                            .foregroundColor(.red)
                    }
                } else {
                    Text(item.value)
                        .font(.system(size: 15))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
            }
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

// MARK: - Helper for Hex Color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}


#Preview {
    ContentWineView()
}
