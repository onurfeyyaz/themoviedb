//
//  MovieTopRated.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 14.09.2024.
//

import Foundation

struct MovieTopRatedResponse: Decodable {
    let page: Int
    let results: [MovieTopRated]
}

struct MovieTopRated: Decodable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
