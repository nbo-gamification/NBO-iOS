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
            let officeCodable = object.office
            else { return nil }

        guard let nboOffice = NBOOffice.initFromCodable(object: officeCodable) else { return nil }
        
        var nboPlayer: NBOPlayer?
        if let playerCodable = object.player {
            nboPlayer = NBOPlayer.initFromCodable(object: playerCodable)
        }
        
        if let categoryOfficeProgressList = object.categoryOfficeProgressList{
            for playerCategoryOfficeProgressCodable in categoryOfficeProgressList {
                guard let playerCategoryOfficeProgressCodable = NBOPlayerCategoryOfficeProgress.initFromCodable(
                    object: playerCategoryOfficeProgressCodable)
                    else { break }
                playerCategoryOfficeProgressList.append(playerCategoryOfficeProgressCodable)
            }
        }
        
        return NBOPlayerOfficeProgress(id: id, office: nboOffice, categoryOfficeProgressList: playerCategoryOfficeProgressList, player: nboPlayer)
    }
}

