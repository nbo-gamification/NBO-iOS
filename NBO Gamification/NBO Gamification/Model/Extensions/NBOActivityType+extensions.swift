//
//  NBOActivityType+extensions.swift
//  NBO Gamification
//
//  Created by dante on 21/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOActivityType: ParseProtocol {

    public typealias ModelCodable = NBOActivityTypeCodable
    public typealias Model = NBOActivityType

    static func initFromCodable(object: ModelCodable) -> Model? {

        guard let name = object.name else { return nil }

        return NBOActivityType(name: name)
    }
}
