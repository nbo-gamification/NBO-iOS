//
//  NBOCategoryOfficeActivityCodable.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOCategoryOfficeActivityCodable : Codable {
    
    public let id : Int?
    public let pointsReward : Int?
    public let isActive : Bool?
    public let categoryOffice : NBOCategoryOfficeCodable?
    public let activity : NBOActivityCodable?
    
    init(id : Int, pointsReward : Int, isActive : Bool, categoryOffice : NBOCategoryOfficeCodable, activity : NBOActivityCodable) {
        self.id = id
        self.pointsReward = pointsReward
        self.isActive = isActive
        self.categoryOffice = categoryOffice
        self.activity = activity
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case pointsReward
        case isActive
        case categoryOffice
        case activity
    }
}
