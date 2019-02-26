//
//  NBOCategoryOfficeProgressScale+extensions.swift
//  NBO Gamification
//
//  Created by dante on 21/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOCategoryOfficeProgressScale: ParseProtocol {

    public typealias ModelCodable = NBOCategoryOfficeProgressScaleCodable
    public typealias Model = NBOCategoryOfficeProgressScale

    static func initFromCodable(object: ModelCodable) -> Model? {

        guard
            let id = object.id,
            let minPoints = object.minPoints,
            let maxPoints = object.maxPoints,
            let isActive = object.isActive
            else { return nil }

        return NBOCategoryOfficeProgressScale(id: id, minPoints: minPoints, maxPoints: maxPoints, isActive: isActive)
    }
}
