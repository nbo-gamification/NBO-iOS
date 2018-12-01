//
//  NBOPlayerCategoryOfficeProgressCodable.swift
//  NBO Gamification
//
//  Created by facundop on 29/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOPlayerCategoryOfficeProgressCodable : Codable {
    
    public let id : Int?
    public let totalPoints : Int?
    public let categoryOffice : NBOCategoryOfficeCodable?
    
    init(id : Int, totalPoints : Int, categoryOffice : NBOCategoryOfficeCodable) {
        self.id = id
        self.totalPoints = totalPoints
        self.categoryOffice = categoryOffice
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case totalPoints
        case categoryOffice
    }
}
