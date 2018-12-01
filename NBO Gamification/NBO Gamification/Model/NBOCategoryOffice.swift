//
//  NBOCategoryOffice.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOCategoryOffice {
    
    public let id : Int
    public var totalPointsRequired : Int
    public var isActive : Bool
    public let office : NBOOffice
    public let category : NBOCategory
    public var progressScaleList : [NBOCategoryOfficeProgressScale]?
    
    init(id : Int, totalPointsRequired : Int, isActive : Bool, office : NBOOffice, category : NBOCategory) {
        self.id = id
        self.totalPointsRequired = totalPointsRequired
        self.isActive = isActive
        self.office = office
        self.category = category
    }
}
