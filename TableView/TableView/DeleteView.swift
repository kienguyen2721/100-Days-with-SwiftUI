//
//  DeleteView.swift
//  TableView
//
//  Created by Nguyễn Trung Kiên on 16/7/25.
//

import Foundation
import SwiftUI



struct DeleteView: View {
    // Danh sách ban đầu
    let originalItems = ["Táo", "Cam", "Chuối", "Xoài", "Dưa hấu"]
    
    // Danh sách hiện tại
    @State private var items: [String] = ["Táo", "Cam", "Chuối", "Xoài", "Dưa hấu"]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteItem)
            }
            .refreshable {
                // Mô phỏng loading (1 giây) rồi reset dữ liệu
                await refreshData()
            }
            .navigationTitle("Trái cây yêu thích")
            .toolbar {
                EditButton()
            }
        }
    }

    // Xoá item
    private func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    // Làm mới dữ liệu (kéo xuống)
    private func refreshData() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000) // Delay 1 giây
        items = originalItems
    }
}
#Preview {
    DeleteView()
}
