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

    func getSecurityToken() -> String? {
        return AppContext.shared.currentUserToken.get()
    }
}

extension NBONetworkManager {
    func login(loginData: NBOLoginData, completion: @escaping (_ user: NBOPlayerCodable?, _ error: String?) -> ()) {
        guard let email = loginData.email, let password = loginData.password else { return }
        let loginDataParameters: [String: String] = [
            "username": loginData.user ?? "",
            "email": email,
            "password": password
        ]
        let session = URLSession.shared
        session.reset {
            self.router.request(.login(loginData: loginDataParameters), securityToken: nil) { (data, response, error) in
                if error != nil {
                    completion(nil, "Network error: \(error?.localizedDescription ?? "unknown error")")
                }
                if let response = response as? HTTPURLResponse {
                    let result = handleNetworkResponse(response)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            completion(nil, NetworkResponse.noData.rawValue)
                            return
                        }
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let user = try decoder.decode(NBOPlayerCodable.self, from: responseData)
                            completion(user, nil)
                            
                        } catch {
                            completion(nil, NetworkResponse.unableToDecode.rawValue)
                        }
                    case .failure(let networkFailureError):
                        var networkError = networkFailureError
                        if let errorDescription = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                            networkError = "\(networkFailureError): \(errorDescription)"
                        }
                        completion(nil, networkError)
                    }
                }
            }
        }
    }

    func logout(idPlayer: Int, completion: @escaping (_ success: Bool, _ error: String?) -> ()) {
        router.request(.logout(id: idPlayer), securityToken: self.getSecurityToken()) { (data, response, error) in
            if error != nil {
                completion(false, "Network error: \(error?.localizedDescription ?? "unknown error")")
            } else {
                completion(true, nil)
            }
        }
    }

    func getOfficesByPlayer(idPlayer: Int, completion: @escaping (_ playerOfficeProgressList: [NBOPlayerOfficeProgressCodable]?, _ error: String?) -> ()) {
        router.request(.getPlayerOffices(playerId: idPlayer), securityToken: self.getSecurityToken()) { (data, response, error) in
            if error != nil {
                completion(nil, "Network error: \(error?.localizedDescription ?? "unknown error")")
            }
            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let playerOfficeProgressCodableList = try decoder.decode([NBOPlayerOfficeProgressCodable].self, from: responseData)
                        completion(playerOfficeProgressCodableList, nil)
                        
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
                
            }
        }
    }
    
    func selectOffice(playerOfficeProgressId: Int, completion: @escaping (_ playerCategoryOfficeProgressList: [NBOPlayerCategoryOfficeProgressCodable]?, _ error: String?) -> ()) {
        
        router.request(.selectOffice(playerOfficeProgressId: playerOfficeProgressId), securityToken: self.getSecurityToken()) { (data, response, error) in
            if error != nil {
                completion(nil, "Network error: \(error?.localizedDescription ?? "unknown error")")
            }
            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let playerOfficeProgressCodableList = try decoder.decode([NBOPlayerCategoryOfficeProgressCodable].self, from: responseData)
                        completion(playerOfficeProgressCodableList, nil)
                        
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
                
            }
        }
    }
    
    func getActivitiesbyCategoryOffice(idCategoryOffice: Int, completion: @escaping (_ categoryOfficeActivityList: [NBOCategoryOfficeActivityCodable]?, _ error: String?) -> ()) {
        
        router.request(.activitiesForCategory(categoryOfficeId: idCategoryOffice), securityToken: self.getSecurityToken()) { (data, response, error) in
            if error != nil {
                completion(nil, "Network error: \(error?.localizedDescription ?? "unknown error")")
            }
            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let categoryOfficeActivityList = try decoder.decode([NBOCategoryOfficeActivityCodable].self, from: responseData)
                        completion(categoryOfficeActivityList, nil)
                        
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
                
            }
        }
    }
    
    func registerActivityAttempt(attemptData: NBORegisterActivityAttemptData, completion: @escaping (_ categoryOfficeActivityAttempt: NBOCategoryOfficeActivityAttemptCodable?, _ error: String?) -> ()) {
        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            let encodedAttemptDataJson = try encoder.encode(attemptData)
            guard let encodedAttemptDataString = String(data: encodedAttemptDataJson, encoding: .utf8) else {throw NSError(domain: "encoding", code: 0, userInfo: nil)}
            
            router.request(.registerActivityAttempt(attemptData: encodedAttemptDataString), securityToken: self.getSecurityToken()) { (data, response, error) in
                if error != nil {
                    completion(nil, "Network error: \(error?.localizedDescription ?? "unknown error")")
                }
                if let response = response as? HTTPURLResponse {
                    let result = handleNetworkResponse(response)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            completion(nil, NetworkResponse.noData.rawValue)
                            return
                        }
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let categoryOfficeActivityAttempt = try decoder.decode(NBOCategoryOfficeActivityAttemptCodable.self, from: responseData)
                            completion(categoryOfficeActivityAttempt, nil)
                            
                        } catch {
                            completion(nil, NetworkResponse.unableToDecode.rawValue)
                        }
                    case .failure(let networkFailureError):
                        completion(nil, networkFailureError)
                    }
                }
            }
        } catch let error {
            completion(nil, "Data encoding error: \(error.localizedDescription)")
        }
    }
}
