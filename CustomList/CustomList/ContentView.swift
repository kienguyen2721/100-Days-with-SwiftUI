//
//  ContentView.swift
//  CustomList
//
//  Created by Nguyễn Trung Kiên on 6/8/25.
//


import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [Food]
    
    /// Thêm danh sách mặc định
    private func insertDefaultItems() {
        let defaults = [
            "Fresh Vegetables",
            "Seasonal Fruits",
            "Milk & Yogurt",
            "Wholegrain Bread",
            "Chicken & Fish"
        ]
        for name in defaults {
            context.insert(Food(title: name, isCompleted: Bool.random()))
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isCompleted ? .green : .gray)
                        Text(item.title)
                            .font(.system(.title3, design: .rounded))
                            .foregroundColor(item.isCompleted ? .green : .primary)
                            .strikethrough(item.isCompleted, color: .green)
                    }
                    .padding(.vertical, 4)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            withAnimation { context.delete(item) }
                        } label: {
                            Label("Remove", systemImage: "trash.fill")
                        }
                    }
                }
            }
            .navigationTitle("Food Checklist")
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: insertDefaultItems) {
                            Label("Add Default", systemImage: "basket")
                        }
                    }
                }
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView(
                        "No Items",
                        systemImage: "cart.badge.plus",
                        description: Text("Tap the basket icon to add starter groceries.")
                    )
                }
            }
        }
    }
}

#Preview("With Data") {
    let sampleData = [
        Food(title: "Fresh Vegetables", isCompleted: false),
        Food(title: "Seasonal Fruits", isCompleted: true),
        Food(title: "Milk & Yogurt", isCompleted: Bool.random()),
        Food(title: "Wholegrain Bread", isCompleted: Bool.random()),
        Food(title: "Chicken & Fish", isCompleted: Bool.random())
    ]
    
    let container = try! ModelContainer(for: Food.self,
                                        configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    for food in sampleData {
        container.mainContext.insert(food)
    }
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty") {
    ContentView()
        .modelContainer(for: Food.self, inMemory: true)
}
