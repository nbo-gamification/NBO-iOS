//
//  EndPointType.swift
//  NBO Gamification
//
//  Created by facundop on 23/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders { get }
}
