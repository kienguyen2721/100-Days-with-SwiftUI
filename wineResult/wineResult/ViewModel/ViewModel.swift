//
//  ViewModel.swift
//  wineResult
//
//  Created by Nguyễn Trung Kiên on 11/11/25.
//

import Foundation

import Foundation
//godzilla_1
class ViewModel: ObservableObject {
    @Published var selectedSegment = 0
    @Published var searchText = ""
    @Published var showSearch = false
    
    @Published var products: [Ebay] = []
    
    init() {
        loadEbays()
    }
    
    func loadEbays() {
        let data: [(String, Int, String, Double)] = [
            ("Shin Godzilla", 2016, "$19.99", 4.6),
            ("Godzilla Minus One", 2023, "$24.99", 4.8),
            ("King Kong (1933)", 1933, "$14.99", 4.4),
            ("King Kong (2005)", 2005, "$17.99", 4.2),
            ("Cloverfield", 2008, "$15.99", 4.0),
            ("Pacific Rim", 2013, "$18.99", 4.3),
            ("Pacific Rim: Uprising", 2018, "$16.99", 3.4),
            ("The Host", 2006, "$13.99", 4.5),
            ("Trollhunter", 2010, "$12.99", 4.1),
            ("Colossal", 2016, "$11.99", 3.9),
            ("Rampage", 2018, "$14.49", 3.6)
        ]
        
        let images = ["godzilla_1", "monster_1", "monster_2"]
        var lastImage: String? = nil
        
        products = data.map { name, year, author, rating in
            
            var available = images
            if let last = lastImage {
                available.removeAll { $0 == last }
            }
            
            let chosen = available.randomElement() ?? "monster_1"
            lastImage = chosen
            
            return Ebay(name: name, year: year, author: author, rating: rating, imageName: chosen, content: [])
        }
    }

    
    var filteredMovies: [Ebay] {
        guard !searchText.isEmpty else { return products }
        return products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
   
    
   
}
