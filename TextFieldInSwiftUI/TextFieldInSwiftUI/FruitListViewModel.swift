//
//  FruitListViewModel.swift
//  TextFieldInSwiftUI
//
//  Created by Nguyễn Trung Kiên on 27/8/25.
//

import Foundation
import Combine

@MainActor
final class FruitListViewModel: ObservableObject {
    // initial dataset (kept so we can reset)
    private let initialFruits: [Fruit] = [
        Fruit(name: "Apple"),
        Fruit(name: "Banana"),
        Fruit(name: "Orange"),
        Fruit(name: "Mango"),
        Fruit(name: "Guava"),
        Fruit(name: "Watermelon"),
        Fruit(name: "Grape"),
        Fruit(name: "Pear"),
        Fruit(name: "Tangerine"),
        Fruit(name: "Pineapple"),
        Fruit(name: "Plum"),
        Fruit(name: "Coconut")
    ]

    // current data shown
    @Published private(set) var allFruits: [Fruit]

    // text entered by user in header (TextField)
    @Published var searchText: String = ""

    private var cancellables = Set<AnyCancellable>()

    init() {
        self.allFruits = initialFruits
        // Optional: debounce example (uncomment if desired)
        // $searchText
        //   .debounce(for: .milliseconds(200), scheduler: DispatchQueue.main)
        //   .sink { _ in }
        //   .store(in: &cancellables)
    }

    // computed filtered list — view updates when @Published changes
    var filteredFruits: [Fruit] {
        let keyword = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !keyword.isEmpty else { return allFruits }
        return allFruits.filter { $0.name.lowercased().contains(keyword) }
    }

    // add / remove helpers
    func addFruit(name: String) {
        let trimmed = name.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        allFruits.append(Fruit(name: trimmed))
    }

    func remove(at offsets: IndexSet) {
        // remove based on filtered view indices
        let idsToRemove = offsets.map { filteredFruits[$0].id }
        allFruits.removeAll { idsToRemove.contains($0.id) }
    }

    // Pull-to-refresh: reset search and reset data to original list.
    // This is async so it can be used inside .refreshable { await viewModel.refresh() }
    func refresh() async {
        // Optional small delay to show refresh spinner smoothly
        try? await Task.sleep(nanoseconds: 200_000_000) // 200 ms
        searchText = ""
        allFruits = initialFruits
    }
}
