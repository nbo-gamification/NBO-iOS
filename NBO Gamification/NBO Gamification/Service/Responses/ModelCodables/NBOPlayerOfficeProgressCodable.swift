//
//  NBOPlayerOfficeProgressCodable.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOPlayerOfficeProgressCodable: Codable {
    
    public let id: Int?
    public let player: NBOPlayerCodable?
    public let office: NBOOfficeCodable?
    public var categoryOfficeProgressList : [NBOPlayerCategoryOfficeProgressCodable]?
    
    init(id: Int, player: NBOPlayerCodable, office: NBOOfficeCodable, categoryOfficeProgressList : [NBOPlayerCategoryOfficeProgressCodable]) {
        self.id = id
        self.player = player
        self.office = office
        self.categoryOfficeProgressList = categoryOfficeProgressList
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case player
        case office
        case categoryOfficeProgressList
    }
}
