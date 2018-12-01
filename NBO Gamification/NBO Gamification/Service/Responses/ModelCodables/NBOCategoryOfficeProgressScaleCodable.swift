//
//  NBOCategoryOfficeProgressScaleCodable.swift
//  NBO Gamification
//
//  Created by facundop on 29/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOCategoryOfficeProgressScaleCodable : Codable {
    
    public let id : Int?
    public let minPoints : Int?
    public let maxPoints : Int?
    public let isActive : Bool?
    
    init(id : Int, minPoints : Int, maxPoints : Int, isActive : Bool) {
        self.id = id
        self.minPoints = minPoints
        self.maxPoints = maxPoints
        self.isActive = isActive
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case minPoints
        case maxPoints
        case isActive
    }
}
