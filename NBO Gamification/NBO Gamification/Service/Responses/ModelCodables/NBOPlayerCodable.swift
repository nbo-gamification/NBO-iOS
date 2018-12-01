//
//  NBOPlayerCodable.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOPlayerCodable: Codable {
    
    public let email: String?
    public let firstName: String?
    public let lastName: String?
    public let password: String?
    public let isActive: Bool?
    
    init(email : String, firstName : String, lastName : String, password: String, isActive: Bool) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.isActive = isActive
    }
    
    enum CodingKeys: String, CodingKey {
        case email
        case firstName
        case lastName
        case password
        case isActive
    }
}
