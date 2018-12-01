//
//  HTTPTask.swift
//  NBO Gamification
//
//  Created by facundop on 23/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public enum HTTPTask {
    
    case request
    
    case requestWithParameters(
        bodyParameters: Parameters?,
        urlParameters: Parameters?
    )
    
    case requestWithParametersAndHeaders(
        bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionalHeaders: HTTPHeaders?
    )
}
