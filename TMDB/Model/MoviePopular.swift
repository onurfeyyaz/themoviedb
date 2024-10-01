//
//  MoviePopular.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 14.09.2024.
//

import Foundation

struct MoviePopularResponse: Decodable {
    let results: [MoviePopular]
}

struct MoviePopular: Decodable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
    }
}
