//
//  NBOCategory+extensions.swift
//  NBO Gamification
//
//  Created by dante on 21/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOCategory: ParseProtocol {

    public typealias ModelCodable = NBOCategoryCodable
    public typealias Model = NBOCategory

    static func initFromCodable(object: ModelCodable) -> Model? {
        guard
            let id = object.id,
            let categoryName = object.categoryName
            else { return nil }

        if let description = object.description {
            return NBOCategory(id: id, name: categoryName, description: description)

        } else {
            return NBOCategory(id: id, name: categoryName)
        }
    }
}
