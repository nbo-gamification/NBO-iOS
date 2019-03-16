//
//  NBOLoginData.swift
//  NBO Gamification
//
//  Created by facundop on 12/03/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation

public struct NBOLoginData : Codable {
    
    public let user : String?
    public let email : String?
    public let password : String?
    
    enum CodingKeys: String, CodingKey {
        case user
        case email
        case password
    }
}
