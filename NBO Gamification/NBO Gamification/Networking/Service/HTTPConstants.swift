//
//  HTTPConstants.swift
//  NBO Gamification
//
//  Created by facundop on 23/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias Parameters = [String:Any]
public typealias HTTPHeaders = [String:String]

public enum HTTPHeaderField {
    static let contentType = "Content-Type"
}

public enum HTTPHeaderValueMediaTypeApplication {
    static let xWWWFormUrlencodedUtf8 = "application/x-www-form-urlencoded; charset=utf-8"
    static let json = "application/json"
}
