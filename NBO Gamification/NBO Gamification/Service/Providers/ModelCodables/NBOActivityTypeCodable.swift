//
//  NBOActivityTypeCodable.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOActivityTypeCodable : Codable {
    
    public let name : String?
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
