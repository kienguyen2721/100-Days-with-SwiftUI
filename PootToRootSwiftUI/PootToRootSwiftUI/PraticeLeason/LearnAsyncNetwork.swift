//
//  LearnAsyncNetwork.swift
//  PootToRootSwiftUI
//
//  Created by Nguyễn Trung Kiên on 14/11/25.
//

import Foundation
import SwiftUI


struct LearnAsyncNetwork: View {
    var body: some View {
        Text(getText())
            .font(.headline)
        
    }
    func getText() -> String {
        var text: String = "Hello, World!"
        DispatchQueue.global().async {
            let result = (0..<1_000_000).reduce(0, +)
            
            // Cập nhật UI
            DispatchQueue.main.async {
                print(result)
                text = String(result)
            }
        }
        return text
    }
}
#Preview {
    LearnAsyncNetwork()
}
