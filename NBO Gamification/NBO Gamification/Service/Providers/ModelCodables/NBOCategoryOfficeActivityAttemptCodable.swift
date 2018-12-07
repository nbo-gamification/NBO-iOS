//
//  NBOCategoryOfficeActivityAttemptCodable.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOCategoryOfficeActivityAttemptCodable : Codable {
    
    public let id : Int?
    public let datetime : Date?
    public let result : Bool?
    public let playerCategoryOfficeProgress : NBOPlayerCategoryOfficeProgressCodable?
    public let categoryOfficeActivity : NBOCategoryOfficeActivityCodable?
    
    enum CodingKeys: String, CodingKey {
        case id
        case datetime
        case result
        case playerCategoryOfficeProgress
        case categoryOfficeActivity
    }
}
