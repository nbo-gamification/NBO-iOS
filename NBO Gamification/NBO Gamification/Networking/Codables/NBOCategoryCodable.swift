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
    public let categoryName : String?
    public let description : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryName
        case description
    }
}
