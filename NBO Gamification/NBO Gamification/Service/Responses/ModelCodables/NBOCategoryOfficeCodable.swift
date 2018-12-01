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
    
    init(id : Int, totalPointsRequired : Int, isActive : Bool, office : NBOOfficeCodable, category : NBOCategoryCodable) {
        self.id = id
        self.totalPointsRequired = totalPointsRequired
        self.isActive = isActive
        self.office = office
        self.category = category
        self.progressScaleList = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case totalPointsRequired
        case isActive
        case office
        case category
        case progressScaleList
    }
}
