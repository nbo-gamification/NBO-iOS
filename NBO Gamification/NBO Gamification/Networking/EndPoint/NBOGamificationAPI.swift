//
//  NBOGamificationAPI.swift
//  NBO Gamification
//
//  Created by facundop on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public enum NBOGamificationAPI {
    case login(id:Int)
    case logout(id:Int)
    case getPlayerOffices(playerId:Int)
    case selectOffice(playerOfficeProgressId:Int)
    case activitiesForCategory(categoryOfficeId:Int)
    case registerActivityAttempt(attemptData:String)
}

extension NBOGamificationAPI: EndPointType {

    var environmentBaseURL : String {
        switch NBONetworkManager.environment {
            case .production: return "https://nbo-gamification.herokuapp.com/api/"
            case .qa: return "https://nbo-gamification.herokuapp.com/api/"
            case .staging: return "https://nbo-gamification.herokuapp.com/api/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .login:
            return ""
        case .logout:
            return ""
        case .getPlayerOffices(let id):
            return "getOfficesByPlayer/\(id)"
        case .selectOffice(let id):
            return "selectOffice/\(id)"
        case .activitiesForCategory(let id):
            return "getActivitiesbyCategoryOffice/\(id)"
        case .registerActivityAttempt:
            return "registerActivityAttempt/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .get
        case .logout:
            return .get
        case .getPlayerOffices:
            return .get
        case .selectOffice:
            return .get
        case .activitiesForCategory:
            return .get
        case .registerActivityAttempt:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login:
            return .request
        case .logout:
            return .request
        case .getPlayerOffices:
            return .request
        case .selectOffice:
            return .request
        case .activitiesForCategory:
            return .request
        case .registerActivityAttempt(let attemptData):
            return .requestWithParameters(bodyParameters: ["data":attemptData], urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
}
