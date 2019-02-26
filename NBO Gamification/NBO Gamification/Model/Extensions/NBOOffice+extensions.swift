//
//  NBOOffice+extensions.swift
//  NBO Gamification
//
//  Created by dante on 20/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOOffice: ParseProtocol {

    public typealias ModelCodable = NBOOfficeCodable
    public typealias Model = NBOOffice

    static func initFromCodable(object: ModelCodable) -> Model? {
        guard let id = object.id, let officeName = object.officeName else { return nil }

        return NBOOffice(id: id, name: officeName)
    }
}
