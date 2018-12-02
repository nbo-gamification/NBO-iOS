//
//  NBOPlayerOfficeProgress.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOPlayerOfficeProgress {
    
    public let id: Int
    public let player: NBOPlayer
    public let office: NBOOffice
    public var categoryOfficeProgressList : [NBOPlayerCategoryOfficeProgress]
    
    init(id: Int, player: NBOPlayer, office: NBOOffice, categoryOfficeProgressList : [NBOPlayerCategoryOfficeProgress]) {
        self.id = id
        self.player = player
        self.office = office
        self.categoryOfficeProgressList = categoryOfficeProgressList
    }
}
