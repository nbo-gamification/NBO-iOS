//
//  NBOCategoryOfficeCodable.swift
//  NBO Gamification
//
//  Created by facundop on 29/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOCategoryOfficeCodable : Codable {
    
    public let id : Int?
    public let totalPointsRequired : Int?
    public let isActive : Bool?
    public let office : NBOOfficeCodable?
    public let category : NBOCategoryCodable?
    public let progressScaleList : [NBOCategoryOfficeProgressScaleCodable]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case totalPointsRequired
        case isActive
        case office
        case category
        case progressScaleList
    }
}
