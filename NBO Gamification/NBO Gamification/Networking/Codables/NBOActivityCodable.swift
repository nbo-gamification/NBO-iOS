//
//  NBOActivityCodable.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOActivityCodable : Codable {
    
    public let id : Int?
    public let description : String?
    public let isActive : Bool?
    public let type : NBOActivityTypeCodable?
    
    // Connect activity type
    public let instructions : String?
    public let solutionCode : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case isActive
        case type
        
        case instructions
        case solutionCode
    }
}
