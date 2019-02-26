//
//  NBOCategoryOfficeActivity+extensions.swift
//  NBO Gamification
//
//  Created by dante on 21/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOCategoryOfficeActivity: ParseProtocol {

    public typealias ModelCodable = NBOCategoryOfficeActivityCodable
    public typealias Model = NBOCategoryOfficeActivity

    static func initFromCodable(object: ModelCodable) -> Model? {

        guard
            let id = object.id,
            let pointsReward = object.pointsReward,
            let isActive = object.isActive,
            let categoryOfficeCodable = object.categoryOffice,
            let activityCodable = object.activity
            else { return nil }

        guard
            let nboCategoryOffice = NBOCategoryOffice.initFromCodable(object: categoryOfficeCodable),
            let nboActivity = NBOActivity.initFromCodable(object: activityCodable)
            else { return nil }

        return NBOCategoryOfficeActivity(id: id, pointsReward: pointsReward, isActive: isActive, categoryOffice: nboCategoryOffice, activity: nboActivity)
    }
}
