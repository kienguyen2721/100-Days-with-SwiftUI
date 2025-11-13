//
//  LearnAsync.swift
//  PootToRootSwiftUI
//
//  Created by Nguyễn Trung Kiên on 13/11/25.
//

import Foundation
import SwiftUI

struct LearnAsync: View {
    @State private var isLoadingComplte: Bool = false
    var body: some View {
        VStack {
            if isLoadingComplte {
                Text("đã có danh sách")
            } else {
                Text("Loading")
            }
        }
       
       
        .task {
            await loadWeather()
        }
    }

    func loadWeather() async {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoadingComplte = true
        }
        
    }
}

#Preview {
    LearnAsync()
}
