//
//  LearnSwiftDataApp.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 14/11/25.
//

import SwiftUI

@main
struct LearnSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Student.self, Course.self])
    }
}
