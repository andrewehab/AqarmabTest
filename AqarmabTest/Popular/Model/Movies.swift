//
//  Movies.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import Foundation

//MARK: - Movies
struct Movies: Codable {
    
    let movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
}

