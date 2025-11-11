//
//  ContentView.swift
//  myMovieList
//
//  Created by Nguyễn Trung Kiên on 5/11/25.
//

import SwiftUI


struct ContentView: View {
    @State private var isSearchVisible = false
    @State private var searchQuery = ""
    @State private var selectedSegment = 0
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 12) {
                ZStack {
                    Picker("", selection: $viewModel.selectedSegment) {
                        Text("Movies").tag(0)
                        Text("Actors").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 220)

                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.easeInOut) {
                                viewModel.showSearch = true
                                isSearchVisible = true   // ✅ hiển thị cả hai
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)

                if viewModel.selectedSegment == 0 {
                    MovieGridView(movies: viewModel.filteredMovies)
                } else {
                    ActorListView(actors: viewModel.filteredActors)
                }
            }

            if viewModel.showSearch {
                SearchOverlayView(
                    isVisible: $isSearchVisible,
                    query: $searchQuery,
                    currentSegment: selectedSegment,
                    movies: viewModel.movies,
                    actors: viewModel.actors
                )
            }
        }
        .onChange(of: isSearchVisible) { newValue in
            if !newValue {
                withAnimation(.easeInOut) {
                    viewModel.showSearch = false
                }
            }
        }
        .preferredColorScheme(.dark)
        .animation(.easeInOut, value: viewModel.showSearch)
    }
}


//#Preview {
//    ContentView()
//}
