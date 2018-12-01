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
    case selectOffice(page:Int)
    case activitiesForCategory(page:Int)
    case registerActivityAttempt(id:Int)
}

extension NBOGamificationAPI: EndPointType {

    var environmentBaseURL : String {
        switch NBONetworkManager.environment {
            case .production: return "https://api.nbo.org/"
            case .qa: return "https://qa..nbo.org/"
            case .staging: return "https://staging.nbo.org/"
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
        case .selectOffice:
            return ""
        case .activitiesForCategory:
            return ""
        case .registerActivityAttempt:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
}
