//
//  As.swift
//  PootToRootSwiftUI
//
//  Created by Nguyễn Trung Kiên on 14/11/25.
//

import Foundation
import SwiftUI


struct AsyncExampleView: View {
    @State private var number: Int?
    
    var body: some View {
        VStack(spacing: 20) {
            if let number = number {
                Text("Kết quả: \(number)")
                    .font(.largeTitle)
            } else {
                Text("Đang tải...")
            }
        }
        .task { // SwiftUI tự chạy khi View xuất hiện
            number = await fetchNumber()
        }
    }
    func fetchNumber() async -> Int {
        await Task.sleep(2 * 1_000_000_000) // ngủ 2 giây
        return 42
    }

}
