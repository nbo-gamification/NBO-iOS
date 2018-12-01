//
//  NBOConnectActivity.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public var minPoints : Int?

public final class NBOConnectActivity : NBOActivity {
    
    public var instructions : String
    public var solutionCode : String
    public var britelingList : [NBOBriteling]?
    
    init(id: Int, description: String, isActive: Bool, type: NBOActivityType, instructions : String, solutionCode : String) {
        self.instructions = instructions
        self.solutionCode = solutionCode
        
        super.init(id: id, description: description, isActive: isActive, type: type)
    }
}
