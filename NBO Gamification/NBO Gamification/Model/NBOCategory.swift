//
//  NBOCategory.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOCategory {
    
    public let id : Int
    public var name : String
    public var description : String?
    
    init(id : Int, name : String) {
        self.id = id
        self.name = name
    }
}
