//
//  FirstLeason.swift
//  PootToRootSwiftUI
//
//  Created by Nguyễn Trung Kiên on 14/11/25.
//

import Foundation
import SwiftUI

//Bài 1 — Delay 2 giây rồi hiển thị text

struct FirstLeason: View {
    @State private var message = "Loading..."

    var body: some View {
        Text(message)
            .font(.largeTitle)
            .task {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                message = "Complete"
            }
    }
}

//Bài 2 — Gọi hàm async đơn giản



struct SecondLeason: View {
    @State private var number: Int?

    var body: some View {
        VStack {
            Text(number == nil ? "Creating..." : "NUmber: \(number!)")
                .font(.largeTitle)
        }
        .task {
            number = await randomNumber()
        }
    }
    func randomNumber() async -> Int {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return Int.random(in: 1...100)
    }
}

//Bài 3 — Nhấn nút để gọi async
//


struct ThirdLeason: View {
    @State private var result = ""

    var body: some View {
        VStack(spacing: 20) {
            Text(result)
                .font(.title)

            Button("Download") {
                Task {
                    result = await fetchData()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
    func fetchData() async -> String {
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        return "Successfully Fetch!"
    }
}

//Bài 1 — Tải 2 API liên tiếp (chaining async/await)

//Yêu cầu:
//Giả lập 2 API:
//
//fetchUserID() → trả về ID sau 1 giây
//
//fetchUserName(id:) → trả về tên sau 1 giây

struct AdvancedFirst: View {
    
    @State private var name = "Đang tải..."

    
    var body: some View {
        
        Text(name)
            .font(.title)
            .task {
                do {
                    let id = try await fetchUserID()
                    let username = try await fetchUserName(id: id)
                    name = "User: \(username)"
                } catch {
                    name = "Lỗi tải dữ liệu"
                }
            }
    }
    
    func fetchUserID() async throws -> Int {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return 42
    }
    
    func fetchUserName(id: Int) async throws -> String {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "Nguyễn Trung Kiên"
    }
    
}

#Preview {
    AdvancedFirst()
}
