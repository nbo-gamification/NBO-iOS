//
//  NBOPlayer+extensions.swift
//  NBO Gamification
//
//  Created by dante on 20/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

extension NBOPlayer: ParseProtocol {

    public typealias ModelCodable = NBOPlayerCodable
    public typealias Model = NBOPlayer

    static func initFromCodable(object: ModelCodable) -> Model? {

        guard
            let id = object.id,
            let email = object.email,
            let firstName = object.firstName,
            let lastName = object.lastName,
            let password = object.password
            else { return nil }

        return NBOPlayer(id: id, email: email, firstName: firstName, lastName: lastName, password: password)
    }

}
