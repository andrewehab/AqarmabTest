//
//  Movie.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import Foundation

//MARK: - Movie
struct Movie: Codable {
    let title : String?
    let overview : String?
    let releaseDate : String?
    let voteAgerage : Double?
    let posterPath : String?
    let backdropPath : String?
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case releaseDate = "release_date"
        case voteAgerage = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
}
