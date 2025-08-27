//
//  ContentView.swift
//  TextFieldInSwiftUI
//
//  Created by Nguyễn Trung Kiên on 27/8/25.
//

import SwiftUI
struct Fruit: Identifiable, Hashable {
    let id = UUID()
    let name: String
}


struct ContentView: View {
    @StateObject var viewModel: FruitListViewModel

    // to control keyboard focus
    @FocusState private var isSearchFocused: Bool

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header: TextField acting as table header
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search fruits...", text: $viewModel.searchText)
                        .textFieldStyle(.plain)
                        .submitLabel(.done)
                        .focused($isSearchFocused)
                        .onSubmit {
                            isSearchFocused = false
                        }
                }
                .padding(10)
                .background(.regularMaterial)
                .cornerRadius(8)
                .padding([.horizontal, .top], 12)

                // List similar to UITableView with pull-to-refresh
                List {
                    ForEach(viewModel.filteredFruits, id: \.self) { fruit in
                        HStack {
                            Circle()
                                .frame(width: 36, height: 36)
                                .overlay(Text(String(fruit.name.prefix(1))).font(.headline))
                                .opacity(0.15)
                            Text(fruit.name)
                                .font(.body)
                            Spacer()
                        }
                        .padding(.vertical, 6)
                    }
                    .onDelete(perform: viewModel.remove)
                }
                .listStyle(.plain)
                .animation(.default, value: viewModel.filteredFruits)
                // pull-to-refresh: when user pulls down enough, this is triggered
                .refreshable {
                    await viewModel.refresh()
                }
            }
            .navigationTitle("Fruit List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // demo: add a random new fruit
                        viewModel.addFruit(name: "New Fruit \(Int.random(in: 1...99))")
                    }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Add fruit")
                }
            }
            .onTapGesture {
                // tap background to dismiss keyboard
                isSearchFocused = false
            }
        }
    }
}




#Preview {
    ContentView(viewModel: FruitListViewModel())
}
