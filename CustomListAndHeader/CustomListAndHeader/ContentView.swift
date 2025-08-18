//
//  ContentView.swift
//  CustomListAndHeader
//
//  Created by Nguyễn Trung Kiên on 18/8/25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                CustomNavBar()
                CustomVideoView()
                ArticleView()
                
            }
            
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
