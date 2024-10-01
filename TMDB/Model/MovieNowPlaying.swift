//
//  MovieNowPlaying.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 14.09.2024.
//

import Foundation

struct MovieNowPlayingResponse: Decodable {
    let dates: NowPlayingDates
    let page: Int
    let results: [MovieNowPlaying]
}

struct MovieNowPlaying: Decodable {
    let id: Int
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

struct NowPlayingDates: Decodable {
    let maximum: String
    let minimum: String
}
