//
//  NBOBriteling+extensions.swift
//  NBO Gamification
//
//  Created by dante on 21/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation

extension NBOBriteling: ParseProtocol {

    public typealias ModelCodable = NBOBriteling
    public typealias Model = NBOActivityType

    static func initFromCodable(object: ModelCodable) -> Model? {

        guard let name = object.name

        return NBOActivityType(name: name)
    }
}
