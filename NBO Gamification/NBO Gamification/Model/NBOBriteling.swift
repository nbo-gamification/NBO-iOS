//
//  NBOBriteling.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOBriteling {
    
    public let id : Int
    public var name : String
    public var position : String
    public var image : String?
    
    init(id : Int, name : String, position : String) {
        self.id = id
        self.name = name
        self.position = position
    }
}
