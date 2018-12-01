//
//  NBOCategoryOfficeActivity.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOCategoryOfficeActivity {
    
    public let id : Int
    public var pointsReward : Int
    public var isActive : Bool
    public let categoryOffice : NBOCategoryOffice
    public let activity : NBOActivity
    
    init(id : Int, pointsReward : Int, isActive : Bool, categoryOffice : NBOCategoryOffice, activity : NBOActivity) {
        self.id = id
        self.pointsReward = pointsReward
        self.isActive = isActive
        self.categoryOffice = categoryOffice
        self.activity = activity
    }
}
