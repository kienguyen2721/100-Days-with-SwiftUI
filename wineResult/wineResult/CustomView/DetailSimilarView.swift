import SwiftUI

import SwiftUI

// MARK: - Model
struct VintageDetail: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var year: Int
    var ratings_average: Double
    var type: String
}

// MARK: - WineCardView
struct WineCardView: View {
    var item: VintageDetail

    var typeImage: String {
            if item.type.lowercased().contains("red") {
                return "red_type_wine_img"
            } else {
                return "white_type_img"
            }
        }

    private var typeFontSize: CGFloat { 10 }

    var body: some View {
        ZStack(alignment: .top) {

            // View trắng chạm bottom
            VStack {
                Spacer()
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .frame(width: 126, height: 189)
                        .shadow(color: .black.opacity(0.1), radius: 22, y: 2)

                    VStack(alignment: .leading, spacing: 0) {
                        // Rating
                        HStack(spacing: 4) {
                            Image("filledStar")
                                .resizable()
                                .frame(width: 10, height: 10)
                            Text(String(format: "%.1f", item.ratings_average))
                                .font(.custom("Onest-Regular", size: 10))
                                .foregroundColor(.black)
                        }
                        .padding(.top, 8)
                        .padding(.leading, 8)

                        Spacer()

                        // Name + Year
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(item.year)")
                                .font(.custom("Onest-Regular", size: 12))
                                .foregroundColor(Color(hex: "#717171"))
                            Text(item.name)
                                .font(.custom("Onest-SemiBold", size: 12))
                                .foregroundColor(Color(hex: "#1F1F1F"))
                                .lineLimit(1)
                        }
                        .padding(.bottom, 37 + 10)
                        .padding(.horizontal, 8)
                    }

                    // typeImage (bottom)
                    VStack {
                        Spacer()
                        Image(typeImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 126, height: 37)
                            .lineLimit(1)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                   
                }
                .frame(width: 126, height: 189)
            }
            HStack {
                Spacer()
                Image(item.type)

                    .frame(width: 37)
//                    .background(Color.cyan)
            }
            .padding(.top, 34)
            Image("model_wine_other")
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 138)
                .shadow(color: .black.opacity(0.25), radius: 6, y: 4)
                .padding(.top, 0)

        }
        .frame(width: 126, height: 223)
        .background(Color.clear)
    }
}


// MARK: - List View (Horizontal Scroll)
struct OtherVintagesView: View {
    var items: [VintageDetail]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(items) { item in
                    WineCardView(item: item)
                }
            }
            .padding(.horizontal, 16)
        }
        .background(Color.clear)
    }
}

// MARK: - Preview (10 mẫu rượu)
struct OtherVintagesView_Previews: PreviewProvider {
    static var previews: some View {
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
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
