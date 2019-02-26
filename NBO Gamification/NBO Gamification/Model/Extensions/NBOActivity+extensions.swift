//
//  NBOActivity+extensions.swift
//  NBO Gamification
//
//  Created by dante on 21/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOActivity: ParseProtocol {

    public typealias ModelCodable = NBOActivityCodable
    public typealias Model = NBOActivity

    static func initFromCodable(object: ModelCodable) -> Model? {

        guard let id = object.id,
            let description = object.description,
            let isActive = object.isActive,
            let activityTypeCodable = object.type
            else { return nil }

        guard let nboActivityType = NBOActivityType.initFromCodable(object: activityTypeCodable) else { return nil }
        return NBOActivity(id: id, description: description, isActive: isActive, type: nboActivityType)
    }
}
