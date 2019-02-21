//
//  NBOCategoryOffice+extensions.swift
//  NBO Gamification
//
//  Created by dante on 21/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOCategoryOffice: ParseProtocol {

    public typealias ModelCodable = NBOCategoryOfficeCodable
    public typealias Model = NBOCategoryOffice

    static func initFromCodable(object: ModelCodable) -> Model? {
        guard
            let id = object.id,
            let totalPointsRequired = object.totalPointsRequired,
            let isActive = object.isActive,
            let officeCodable = object.office,
            let categoryCodable = object.category
            else { return nil }
        guard
            let nboOffice = NBOOffice.initFromCodable(object: officeCodable),
            let nboCategory = NBOCategory.initFromCodable(object: categoryCodable)
            else { return nil }

        return NBOCategoryOffice(id: id, totalPointsRequired: totalPointsRequired, isActive: isActive, office: nboOffice, category: nboCategory)
    }
}
