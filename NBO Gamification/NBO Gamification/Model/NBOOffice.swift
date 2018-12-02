//
//  NBOOffice.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOOffice {
    
    public let id : Int
    public var name : String
    public var image : String?
    
    init(id : Int, name : String) {
        self.id = id
        self.name = name
    }
}
