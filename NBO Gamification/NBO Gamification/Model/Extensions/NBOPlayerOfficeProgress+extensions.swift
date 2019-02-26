//
//  NBOPlayerOfficeProgress+extensions.swift
//  NBO Gamification
//
//  Created by facundop on 07/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

extension NBOPlayerOfficeProgress: ParseProtocol {

    public typealias ModelCodable = NBOPlayerOfficeProgressCodable
    public typealias Model = NBOPlayerOfficeProgress

    static func initFromCodable(object: ModelCodable) -> Model? {

        var playerCategoryOfficeProgressList: [NBOPlayerCategoryOfficeProgress] = []

        guard let id = object.id,
            let playerCodable = object.player,
            let officeCodable = object.office,
            let categoryOfficeProgressList = object.categoryOfficeProgressList
            else { return nil }

        guard
            let nboPlayer = NBOPlayer.initFromCodable(object: playerCodable),
            let nboOffice = NBOOffice.initFromCodable(object: officeCodable)
            else { return nil }

        for playerCategoryOfficeProgressCodable in categoryOfficeProgressList {
            guard let playerCategoryOfficeProgressCodable = NBOPlayerCategoryOfficeProgress.initFromCodable(
                object: playerCategoryOfficeProgressCodable)
                else { break }
            playerCategoryOfficeProgressList.append(playerCategoryOfficeProgressCodable)
        }

        return NBOPlayerOfficeProgress(id: id, player: nboPlayer, office: nboOffice, categoryOfficeProgressList: playerCategoryOfficeProgressList)
    }

}

