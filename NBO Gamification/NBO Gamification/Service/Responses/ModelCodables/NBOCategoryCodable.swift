//
//  NBOCategoryCodable.swift
//  NBO Gamification
//
//  Created by facundop on 29/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOCategoryCodable : Codable {
    
    public let id : Int?
    public let name : String?
    public let description : String?
    
    init(id : Int, name : String, description : String) {
        self.id = id
        self.name = name
        self.description = description
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
}
