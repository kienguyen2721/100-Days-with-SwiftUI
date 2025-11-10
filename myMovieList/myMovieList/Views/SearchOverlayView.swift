//
//  SearchOverlayView.swift
//  myMovieList
//
//  Created by Nguyễn Trung Kiên on 5/11/25.
//
import SwiftUI

struct SearchOverlayView: View {
    @Binding var isVisible: Bool
    @Binding var query: String
    let currentSegment: Int
    let movies: [Movie]
    let actors: [Actor]
    
    var filteredMovies: [Movie] {
        if query.isEmpty { return [] }
        return movies.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
    
    var filteredActors: [Actor] {
        if query.isEmpty { return [] }
        return actors.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // hiện blur
            VisualEffectBlur(blurStyle: .systemThinMaterialDark)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.spring()) {
                        isVisible = false
                    }
                }
            
            VStack(spacing: 12) {
                // navi
                HStack(spacing: 8) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search \(currentSegment == 0 ? "movies" : "actors")...", text: $query)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            .padding(.vertical, 8)
                            .foregroundColor(.white)
                        
                        if !query.isEmpty {
                            Button(action: { query = "" }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.1))
                    )
                    
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            isVisible = false
                            query = ""
                        }
                    }) {
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.body.bold())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 60)
                
                
                ScrollView {
                    if currentSegment == 0 {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredMovies) { movie in
                                HStack(spacing: 12) {
                                    Image(movie.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 118)
                                        .cornerRadius(8)
                                        .clipped()
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(movie.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text("\(movie.year) • \(movie.author)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        
                                        RatingView(rating: movie.rating)
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top)
                    } else {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredActors) { actor in
                                HStack(spacing: 12) {
                                    Image(actor.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 80)
                                        .cornerRadius(8)
                                        .clipped()
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(actor.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text("Born \(actor.birthYear) • Debut \(actor.debutYear)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        
                                        Text(actor.description)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                            .lineLimit(2)
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top)
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .transition(.opacity.combined(with: .move(edge: .top)))
        .animation(.easeInOut, value: isVisible)
    }
}

// MARK: - VisualEffectBlur
struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
