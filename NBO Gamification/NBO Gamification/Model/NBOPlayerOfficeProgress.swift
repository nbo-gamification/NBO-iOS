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
    public let office: NBOOffice
    public var categoryOfficeProgressList : [NBOPlayerCategoryOfficeProgress]
    public let player: NBOPlayer?
    
    init(id: Int, office: NBOOffice, categoryOfficeProgressList : [NBOPlayerCategoryOfficeProgress], player: NBOPlayer?) {
        self.id = id
        self.office = office
        self.categoryOfficeProgressList = categoryOfficeProgressList
        self.player = player
    }
}
