//
//  NBOPlayerOfficeProgress+Persistence.swift
//  NBO Gamification
//
//  Created by dante on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

extension NBOPlayerOfficeProgress: PersistenceHelper {

    public typealias ImmutableModel = PlayerOfficeProgress
    public typealias Model = NBOPlayerOfficeProgress

    public static func getModelObject(object: PlayerOfficeProgress) -> NBOPlayerOfficeProgress {

        let playerOfficeProgress = NBOPlayerOfficeProgress()
        playerOfficeProgress.idPlayerOfficeProgress = object.idPlayerOfficeProgress
        if let player = object.player {
            playerOfficeProgress.nboPlayer = NBOPlayer.getModelObject(object: player)
        }
        if let office = object.office {
            playerOfficeProgress.nboOffice = NBOOffice.getModelObject(object: office)
        }

        return playerOfficeProgress
    }
}
