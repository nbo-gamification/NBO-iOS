//
//  JSONParameterEncoder.swift
//  NBO Gamification
//
//  Created by facundop on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoder {
    
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let dataAsJSON = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = dataAsJSON
            if urlRequest.value(forHTTPHeaderField: HTTPHeaderField.contentType) == nil {
                urlRequest.setValue(HTTPHeaderValueMediaTypeApplication.json, forHTTPHeaderField: HTTPHeaderField.contentType)
            }
        } catch {
            throw NetworkError.encodingFail
        }
    }
}
