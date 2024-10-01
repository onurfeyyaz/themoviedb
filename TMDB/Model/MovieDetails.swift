//
//  MovieDetails.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 14.09.2024.
//

import Foundation

struct MovieDetails: Decodable {
    let title: String
    let posterPath: String
    let genres: [Genre]
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let runtime: Int
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case genres
        case overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case runtime
        case tagline
    }
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
