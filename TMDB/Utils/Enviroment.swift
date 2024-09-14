//
//  Enviroment.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 14.09.2024.
//

import Foundation

enum Environment {
    enum Keys {
        static let apiKey = "API_KEY"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let infoDict = Bundle.main.infoDictionary else {
            fatalError("infoDictionary not found")
        }
        return infoDict
    }()
    
    static let apiKey: String = {
        guard let apiKeyString = Environment.infoDictionary[Keys.apiKey] as? String else {
            fatalError("API Key not set")
        }
        return apiKeyString
    }()
}
