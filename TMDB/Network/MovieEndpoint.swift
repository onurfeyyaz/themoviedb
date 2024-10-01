//
//  GetMovie.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 1.09.2024.
//

import Foundation
import NetworkLayer

enum MovieEndpoint {
    case nowPlaying
    case popular
    case topRated
    case upcoming
    case details(movieID: Int)
}

// movie ortak switch case ile caseleri dön
extension MovieEndpoint: Endpoint {
    var baseURL: URL {
        URL(string: "https://api.themoviedb.org")!
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            "/3/movie/now_playing"
        case .popular:
            "/3/movie/popular"
        case .topRated:
            "/3/movie/top_rated"
        case .upcoming:
            "/3/movie/upcoming"
        case .details(let movieID):
            "/3/movie/\(movieID)"
        }
    }
    
    var method: NetworkLayer.HTTPMethod {
        .GET
    }
    
    var headers: [String : String]? {
        [
            "accept": "application/json",
            "Authorization": "Bearer \(Environment.apiKey)"
        ]
    }
    
    var queryParameters: [String : CustomStringConvertible]? {
        switch self {
        case .nowPlaying, .popular, .topRated, .upcoming:
            return [
                "language": "en-US",
                "page": 1
            ]
        case .details:
            return [
                "language": "en-US"
            ]
        }
    }
    
    var body: Data? {
        nil
    }
}
