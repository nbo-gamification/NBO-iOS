//
//  NBOCategoryOfficeActivityAttempt+extensions.swift
//  NBO Gamification
//
//  Created by dante on 21/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOCategoryOfficeActivityAttempt: ParseProtocol {

    public typealias ModelCodable = NBOCategoryOfficeActivityAttemptCodable
    public typealias Model = NBOCategoryOfficeActivityAttempt

    static func initFromCodable(object: ModelCodable) -> Model? {

        guard
            let id = object.id,
            let datetime = object.date,
            let result = object.result,
            let playerCategoryOfficeProgressCodable = object.playerCategoryOfficeProgress,
            let categoryOfficeActivity = object.categoryOfficeActivity
            else { return nil }

        guard
            let nboPlayerCategoryOfficeProgress = NBOPlayerCategoryOfficeProgress.initFromCodable(object: playerCategoryOfficeProgressCodable),
            let nboCategoryOfficeActivity = NBOCategoryOfficeActivity.initFromCodable(object: categoryOfficeActivity)
            else { return nil }

        return NBOCategoryOfficeActivityAttempt(id: id, datetime: datetime, result: result, playerCategoryOfficeProgress: nboPlayerCategoryOfficeProgress, categoryOfficeActivity: nboCategoryOfficeActivity)
    }
}
