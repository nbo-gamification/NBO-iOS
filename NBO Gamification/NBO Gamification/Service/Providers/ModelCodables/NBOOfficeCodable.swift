//
//  NBOOfficeCodable.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOOfficeCodable: Codable {
    
    public let id: Int?
    public let name: String?
    public let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
    }
}
