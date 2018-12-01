//
//  NBOActivity.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOActivity {
    
    public let id : Int
    public var description : String
    public var isActive : Bool
    public let type : NBOActivityType
    
    init(id : Int, description : String, isActive : Bool, type : NBOActivityType) {
        self.id = id
        self.description = description
        self.isActive = isActive
        self.type = type
    }
}
