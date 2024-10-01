//
//  MovieUpcoming.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 14.09.2024.
//

import Foundation

struct MovieUpcomingResponse: Decodable {
    let dates: Dates
    let page: Int
    let results: [MovieUpcoming]
}

struct Dates: Decodable {
    let maximum: String
    let minimum: String
}

struct MovieUpcoming: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
