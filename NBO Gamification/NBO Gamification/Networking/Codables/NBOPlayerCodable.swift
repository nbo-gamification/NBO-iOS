//
//  NBOPlayerCodable.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOPlayerCodable: Codable {
    
    public let id : Int?
    public let email: String?
    public let firstName: String?
    public let lastName: String?
    public let token: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "pk"
        case email
        case firstName
        case lastName
        case token = "key"
    }
}
