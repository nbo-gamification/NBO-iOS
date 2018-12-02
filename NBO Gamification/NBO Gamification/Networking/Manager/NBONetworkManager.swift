//
//  NetworkManager.swift
//  NBO Gamification
//
//  Created by facundop on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public enum NetworkEnvironment {
    case qa
    case production
    case staging
}

enum NetworkResponse: String {
    case success
    case authenticationError = "Authentication failed."
    case badRequest = "Bad request."
    case outdated = "The url you requested is outdated"
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
    switch response.statusCode {
    case 200...299: return .success
    case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    case 600: return .failure(NetworkResponse.outdated.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
}

struct NBONetworkManager {
    
    static let environment : NetworkEnvironment = .production
    static let NBOGamificationAPIKey = "NBOGamificationAPIKey"
    private let router = Router<NBOGamificationAPI>()
    
}
