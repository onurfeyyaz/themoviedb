//
//  NetworkManagerProtocol.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 18.09.2024.
//

import Foundation
import NetworkLayer

protocol NetworkRequestProtocol {
    func request<T: Decodable>(_ endpoint: MovieEndpoint, responseType: T.Type) async throws -> T
}

final class NetworkManagerAdapter: NetworkRequestProtocol {
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }

    func request<T: Decodable>(_ endpoint: MovieEndpoint, responseType: T.Type) async throws -> T {
        return try await networkManager.request(endpoint, responseType: responseType)
    }
}

