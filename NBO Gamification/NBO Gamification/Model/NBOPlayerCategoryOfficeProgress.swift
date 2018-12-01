//
//  NBOPlayerCategoryOfficeProgress.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOPlayerCategoryOfficeProgress {
    
    public let id : Int
    public var totalPoints : Int
    public var categoryOffice : NBOCategoryOffice
    
    init(id : Int, totalPoints : Int, categoryOffice : NBOCategoryOffice) {
        self.id = id
        self.totalPoints = totalPoints
        self.categoryOffice = categoryOffice
    }
}
