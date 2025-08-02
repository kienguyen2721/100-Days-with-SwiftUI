//
//  ContentView.swift
//  LearnLazyVGrid
//
//  Created by Nguyễn Trung Kiên on 2/8/25.
//
//ItemModelCell
import SwiftUI

struct ContentView: View {
    @State private var items: [Item] = [
        Item(name: "Item 1", imageName: "test_1"),
        Item(name: "Item 2", imageName: "test_2"),
        Item(name: "Item 3", imageName: "test_3"),
        Item(name: "Item 4", imageName: "test_4"),
        Item(name: "Item 5", imageName: "test_5"),
        Item(name: "Item 6", imageName: "test_6"),
        Item(name: "Item 7", imageName: "test_7"),
        Item(name: "Item 8", imageName: "test_8")
    ]
    private let spacing: CGFloat = 16
       
       private var columns: [GridItem] {
           [
               GridItem(.flexible(), spacing: spacing),
               GridItem(.flexible(), spacing: spacing)
           ]
       }
    var body: some View {
           VStack(spacing: spacing) {
               Text("List Item")
                   .font(.title)
                   .fontWeight(.bold)
                   .frame(maxWidth: .infinity, alignment: .center)
               
               ScrollView {
                   LazyVGrid(columns: columns, spacing: spacing) {
                       ForEach(items) { item in
                           ItemModelCell(item: item) {
                               delete(item)
                           }
                       }
                   }
                   .padding(spacing)
               }
               .refreshable {   // <-- Vuốt để reload
                   await reloadData()
               }
           }
       }
       
       private func delete(_ item: Item) {
           withAnimation {
               items.removeAll { $0.id == item.id }
           }
       }
       
       private func reloadData() async {
           // reset về data ban đầu
           try? await Task.sleep(nanoseconds: 1_000_000_000) // mô phỏng chờ 1s
           await MainActor.run {
               items = [
                   Item(name: "Item 1", imageName: "test_1"),
                   Item(name: "Item 2", imageName: "test_2"),
                   Item(name: "Item 3", imageName: "test_3"),
                   Item(name: "Item 4", imageName: "test_4"),
                   Item(name: "Item 5", imageName: "test_5"),
                   Item(name: "Item 6", imageName: "test_6"),
                   Item(name: "Item 7", imageName: "test_7"),
                   Item(name: "Item 8", imageName: "test_8")
               ]
           }
       }
}

#Preview {
    ContentView()
}
