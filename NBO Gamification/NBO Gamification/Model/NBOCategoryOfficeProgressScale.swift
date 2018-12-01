//
//  NBOCategoryOfficeProgressScale.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOCategoryOfficeProgressScale {
    
    public let id : Int
    public var minPoints : Int
    public var maxPoints : Int
    public var isActive : Bool
    
    init(id : Int, minPoints : Int, maxPoints : Int, isActive : Bool) {
        self.id = id
        self.minPoints = minPoints
        self.maxPoints = maxPoints
        self.isActive = isActive
    }
}
