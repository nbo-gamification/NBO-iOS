//
//  ParameterEncoding.swift
//  NBO Gamification
//
//  Created by facundop on 23/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public protocol ParameterEncoder {
    
    static func encode(
        urlRequest: inout URLRequest,
        with parameters: Parameters
    ) throws
}
