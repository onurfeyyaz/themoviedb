//
//  ViewModel.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 1.09.2024.
//

import Foundation
import NetworkLayer

protocol HomeViewModelProtocol {
    func getNowPlaying() async -> MovieNowPlayingResponse?
    func getPopular() async -> MoviePopularResponse?
    func getTopRated() async -> MovieTopRatedResponse?
    func getUpcoming() async -> MovieUpcomingResponse?
}

final class HomeViewModel: ObservableObject {
    @Published var nowPlayingMovies: [MovieNowPlaying]?
    @Published var popularMovies: [MoviePopular]?
    @Published var topRatedMovies: [MovieTopRated]?
    @Published var upcomingMovies: [MovieUpcoming]?
    
    let networkLayer: NetworkRequestProtocol
    
    init(nowPlayingMovies: [MovieNowPlaying] = [], networkLayer: NetworkRequestProtocol = NetworkManagerAdapter()) {
        self.nowPlayingMovies = nowPlayingMovies
        self.networkLayer = networkLayer
    }
    
    func getMovies() async {
        // they do not wait for each other
        await withTaskGroup(of: Void.self) { group in
            group.addTask {
                self.nowPlayingMovies = await self.getNowPlaying()?.results
            }
            
            group.addTask {
                self.popularMovies = await self.getPopular()?.results
            }
            
            group.addTask {
                self.topRatedMovies = await self.getTopRated()?.results
            }
            
            group.addTask {
                self.upcomingMovies = await self.getUpcoming()?.results
            }
        }
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func getNowPlaying() async -> MovieNowPlayingResponse? {
        do {
            let response = try await networkLayer.request(MovieEndpoint.nowPlaying,
                                                          responseType: MovieNowPlayingResponse.self)
            print("[NOW PLAYING] \(response)")
            return response
        } catch let error as NetworkError {
            print("failed to fetch data \(error.errorDescription ?? "no error description")")
        } catch {
            print("An unexpected error occurred: \(error.localizedDescription)")
        }
        return nil
    }
    
    func getPopular() async -> MoviePopularResponse? {
        do {
            let response = try await networkLayer.request(MovieEndpoint.popular,
                                                          responseType: MoviePopularResponse.self)
            print("[POPULAR] \(response)")
            return response
        } catch let error as NetworkError {
            print("failed to fetch data \(error.errorDescription ?? "no error description")")
        } catch {
            print("An unexpected error occurred: \(error.localizedDescription)")
        }
        return nil
    }
    
    func getTopRated() async -> MovieTopRatedResponse? {
        do {
            let response = try await networkLayer.request(MovieEndpoint.topRated,
                                                          responseType: MovieTopRatedResponse.self)
            print("[TOP RATED] \(response)")
            return response
        } catch let error as NetworkError {
            print("failed to fetch data \(error.errorDescription ?? "no error description")")
        } catch {
            print("An unexpected error occurred: \(error.localizedDescription)")
        }
        return nil
    }
    
    func getUpcoming() async -> MovieUpcomingResponse? {
        do {
            let response = try await networkLayer.request(MovieEndpoint.upcoming,
                                                          responseType: MovieUpcomingResponse.self)
            print("[UPCOMING] \(response)")
            return response
        } catch let error as NetworkError {
            print("failed to fetch data \(error.errorDescription ?? "no error description")")
        } catch {
            print("An unexpected error occurred: \(error.localizedDescription)")
        }
        return nil
    }
}
