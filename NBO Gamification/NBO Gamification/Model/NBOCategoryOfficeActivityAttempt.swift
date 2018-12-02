//
//  NBOCategoryOfficeActivityAttempt.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOCategoryOfficeActivityAttempt {
    
    public let id : Int
    public let datetime : Date
    public let result : Bool
    public let playerCategoryOfficeProgress : NBOPlayerCategoryOfficeProgress
    public let categoryOfficeActivity : NBOCategoryOfficeActivity
    
    init(id : Int, datetime : Date, result : Bool, playerCategoryOfficeProgress : NBOPlayerCategoryOfficeProgress, categoryOfficeActivity : NBOCategoryOfficeActivity) {
        self.id = id
        self.datetime = datetime
        self.result = result
        self.playerCategoryOfficeProgress = playerCategoryOfficeProgress
        self.categoryOfficeActivity = categoryOfficeActivity
    }
}
