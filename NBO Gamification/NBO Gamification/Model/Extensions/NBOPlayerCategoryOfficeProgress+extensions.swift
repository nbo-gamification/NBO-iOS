//
//  NBOPlayerCategoryOfficeProgress+extensions.swift
//  NBO Gamification
//
//  Created by dante on 20/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOPlayerCategoryOfficeProgress: ParseProtocol {

    public typealias ModelCodable = NBOPlayerCategoryOfficeProgressCodable
    public typealias Model = NBOPlayerCategoryOfficeProgress

    static func initFromCodable(object: ModelCodable) -> Model? {
        guard
            let id = object.id,
            let totalPoints = object.totalPoints,
            let categoryOfficeCodable = object.categoryOffice
            else { return nil }
        guard
            let nboCategoryOffice = NBOCategoryOffice.initFromCodable(object: categoryOfficeCodable) else { return nil }

        return NBOPlayerCategoryOfficeProgress(id: id, totalPoints: totalPoints, categoryOffice: nboCategoryOffice)
    }
}
