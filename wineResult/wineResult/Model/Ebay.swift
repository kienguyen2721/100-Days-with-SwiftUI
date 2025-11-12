//
//  Ebay.swift
//  wineResult
//
//  Created by Nguyễn Trung Kiên on 11/11/25.
//

import Foundation
import SwiftUI

struct Ebay: Identifiable {
    let id = UUID()
    let name: String
    let year: Int
    let author: String
    let rating: Double
    let imageName: String
    let content: [DetailWine]
}

struct DetailWine: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let iconName: String?
}
