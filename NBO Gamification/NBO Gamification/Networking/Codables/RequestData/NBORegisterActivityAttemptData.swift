//
//  NBORegisterActivityAttemptData.swift
//  NBO Gamification
//
//  Created by facundop on 16/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation

public struct NBORegisterActivityAttemptData : Codable {
    
    public let result : Bool?
    public let playerCategoryOfficeProgress : Int?
    public let categoryOfficeActivity : Int?
    
    enum CodingKeys: String, CodingKey {
        case result
        case playerCategoryOfficeProgress
        case categoryOfficeActivity
    }
    
    init(result : Bool, playerCategoryOfficeProgressId : Int, categoryOfficeActivityId : Int) {
        self.result = result
        self.playerCategoryOfficeProgress = playerCategoryOfficeProgressId
        self.categoryOfficeActivity = categoryOfficeActivityId
    }
}
