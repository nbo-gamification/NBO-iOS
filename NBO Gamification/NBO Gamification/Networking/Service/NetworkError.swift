//
//  NetworkError.swift
//  NBO Gamification
//
//  Created by facundop on 23/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFail = "Parameter encoding fail."
    case missingURL = "URL is nil."
}
