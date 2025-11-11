//
//  MainViewModel.swift
//  myMovieList
//
//  Created by Nguyễn Trung Kiên on 6/11/25.
//

import Foundation
//godzilla_1
class MainViewModel: ObservableObject {
    @Published var selectedSegment = 0
    @Published var searchText = ""
    @Published var showSearch = false
    
    @Published var movies: [Movie] = []
    @Published var actors: [Actor] = []
    
    init() {
        loadMovies()
        loadActors()
    }
    
    func loadMovies() {
        let data: [(String, Int, String, Double)] = [
            ("Godzilla (1954)", 1954, "Ishirō Honda", 4.5),
            ("Godzilla vs. King Ghidorah", 1991, "Kazuki Ōmori", 4.0),
            ("Godzilla: King of the Monsters", 2019, "Michael Dougherty", 3.5),
            ("Godzilla vs. Kong", 2021, "Adam Wingard", 4.2),
            ("Shin Godzilla", 2016, "Hideaki Anno", 4.6),
            ("Godzilla Minus One", 2023, "Takashi Yamazaki", 4.8),
            ("King Kong (1933)", 1933, "Merian C. Cooper", 4.4),
            ("King Kong (2005)", 2005, "Peter Jackson", 4.2),
            ("Cloverfield", 2008, "Matt Reeves", 4.0),
            ("Pacific Rim", 2013, "Guillermo del Toro", 4.3),
            ("Pacific Rim: Uprising", 2018, "Steven S. DeKnight", 3.4),
            ("The Host", 2006, "Bong Joon Ho", 4.5),
            ("Trollhunter", 2010, "André Øvredal", 4.1),
            ("Colossal", 2016, "Nacho Vigalondo", 3.9),
            ("Rampage", 2018, "Brad Peyton", 3.6),
            ("Monster Hunter", 2020, "Paul W.S. Anderson", 3.2),
            ("The Meg", 2018, "Jon Turteltaub", 3.7),
            ("The Mist", 2007, "Frank Darabont", 4.3),
            ("Love and Monsters", 2020, "Michael Matthews", 4.1),
            ("Monsters", 2010, "Gareth Edwards", 4.0),
            ("Attack on Titan: Part 1", 2015, "Shinji Higuchi", 3.5),
            ("Attack on Titan: Part 2", 2015, "Shinji Higuchi", 3.4)
        ]
        
        let images = ["godzilla_1", "monster_1", "monster_2"]
        var lastImage: String? = nil
        
        movies = data.map { name, year, author, rating in
            
            var available = images
            if let last = lastImage {
                available.removeAll { $0 == last }
            }
            
            let chosen = available.randomElement() ?? "monster_1"
            lastImage = chosen
            
            return Movie(name: name, year: year, author: author, rating: rating, imageName: chosen)
        }
    }


    
    func loadActors() {
        actors = [
            Actor(name: "Leonardo DiCaprio", debutYear: 1991, birthYear: 1974, description: "One of modern Hollywood’s leading men, known for his collaborations with Scorsese.", imageName: "actor_1"),
            Actor(name: "Brad Pitt", debutYear: 1987, birthYear: 1963, description: "Award-winning actor and producer, starred in many iconic films.", imageName: "actor_1"),
            Actor(name: "Will Smith", debutYear: 1990, birthYear: 1968, description: "From rap star to leading Hollywood actor, very versatile.", imageName: "actor_1"),
            Actor(name: "Tom Hanks", debutYear: 1980, birthYear: 1956, description: "Beloved for roles spanning drama, comedy and historical films.", imageName: "actor_1"),
            Actor(name: "Denzel Washington", debutYear: 1977, birthYear: 1954, description: "Powerful performer known for intense roles and charisma.", imageName: "actor_1"),
            Actor(name: "Robert Downey Jr.", debutYear: 1970, birthYear: 1965, description: "Made comeback and became major star in blockbuster era.", imageName: "actor_1"),
            Actor(name: "Samuel L. Jackson", debutYear: 1972, birthYear: 1948, description: "One of the highest-grossing actors ever with many memorable roles.", imageName: "actor_1"),
            Actor(name: "Chris Hemsworth", debutYear: 2002, birthYear: 1983, description: "Australian actor who became global star in action franchises.", imageName: "actor_1"),
            Actor(name: "Ryan Reynolds", debutYear: 1991, birthYear: 1976, description: "Known for comedic timing and leading superhero films.", imageName: "actor_1"),
            Actor(name: "Johnny Depp", debutYear: 1984, birthYear: 1963, description: "Versatile actor known for eccentric characters.", imageName: "actor_1"),
            Actor(name: "Keanu Reeves", debutYear: 1985, birthYear: 1964, description: "Cult favourite and action star across decades.", imageName: "actor_1"),
            Actor(name: "George Clooney", debutYear: 1982, birthYear: 1961, description: "Actor/producer/director and one of Hollywood’s enduring stars.", imageName: "actor_1"),
            Actor(name: "Matt Damon", debutYear: 1992, birthYear: 1970, description: "Star of dramatic and action roles, long-standing career.", imageName: "actor_1"),
            Actor(name: "Ben Affleck", debutYear: 1992, birthYear: 1972, description: "Actor/director known for both commercial and critical successes.", imageName: "actor_1"),
            Actor(name: "Idris Elba", debutYear: 2000, birthYear: 1972, description: "British actor who made major mark in Hollywood action/drama.", imageName: "actor_1"),
            Actor(name: "Chris Evans", debutYear: 2000, birthYear: 1981, description: "Best known for his superhero role and shifting genres.", imageName: "actor_1"),
            Actor(name: "Ryan Gosling", debutYear: 2001, birthYear: 1980, description: "Actor with range, from indie films to major studio hits.", imageName: "actor_1"),
            Actor(name: "Scarlett Johansson", debutYear: 1994, birthYear: 1984, description: "One of the top female stars in Hollywood franchises and beyond.", imageName: "actor_1"),
            Actor(name: "Channing Tatum", debutYear: 2000, birthYear: 1980, description: "Actor known for dance, action and comedy roles.", imageName: "actor_1"),
            Actor(name: "Adam Sandler", debutYear: 1990, birthYear: 1966, description: "Comedian-turned actor with wide popular appeal.", imageName: "actor_1"),
        ]
    }

    
    var filteredMovies: [Movie] {
        guard !searchText.isEmpty else { return movies }
        return movies.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var filteredActors: [Actor] {
        guard !searchText.isEmpty else { return actors }
        return actors.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
}
