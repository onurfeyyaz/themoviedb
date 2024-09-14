//
//  ViewModel.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 1.09.2024.
//

import Foundation
import NetworkLayer

protocol HomeViewModelProtocol {
    func getNowPlaying()
    func getPopular()
    func getTopRated()
    func getUpcoming()
}
final class HomeViewModel: ObservableObject {
    @Published var nowPlayingMovies: [MovieNowPlaying]
    let networkLayer: NetworkManager
    
    init(nowPlayingMovies: [MovieNowPlaying] = [], networkLayer: NetworkManager = .shared) {
        self.nowPlayingMovies = nowPlayingMovies
        self.networkLayer = networkLayer
    }
    
    func getMovies() {
        getNowPlaying()
        getPopular()
        getTopRated()
        getUpcoming()
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func getNowPlaying() {
        Task {
            do {
                let response = try await networkLayer.request(MovieEndpoint.nowPlaying,
                                                              responseType: MovieNowPlayingResponse.self)
                print("[NOW PLAYING] \(response)")
            } catch let error as NetworkError {
                print("failed to fetch data \(error.errorDescription ?? "no error description")")
            }
        }
    }
    
    func getPopular() {
        Task {
            do {
                let response = try await networkLayer.request(MovieEndpoint.popular,
                                                              responseType: MoviePopularResponse.self)
                print("[POPULAR] \(response)")
            } catch let error as NetworkError {
                print("failed to fetch data \(error.errorDescription ?? "no error description")")
            }
        }
    }
    
    func getTopRated() {
        Task {
            do {
                let response = try await networkLayer.request(MovieEndpoint.topRated,
                                                              responseType: MovieTopRatedResponse.self)
                print("[TOP RATED] \(response)")
            } catch let error as NetworkError {
                print("failed to fetch data \(error.errorDescription ?? "no error description")")
            }
        }
    }
    
    func getUpcoming() {
        Task {
            do {
                let response = try await networkLayer.request(MovieEndpoint.upcoming,
                                                              responseType: MovieUpcomingResponse.self)
                print("[UPCOMING] \(response)")
            } catch let error as NetworkError {
                print("failed to fetch data \(error.errorDescription ?? "no error description")")
            }
        }
    }
}
