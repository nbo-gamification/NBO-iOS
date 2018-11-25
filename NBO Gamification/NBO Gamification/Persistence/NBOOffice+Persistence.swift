//
//  NBOOffice+Persistence.swift
//  NBO Gamification
//
//  Created by dante on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

extension NBOOffice: PersistenceHelper {

    public typealias ImmutableModel = Office
    public typealias Model = NBOOffice

    public static func getModelObject(object: Office) -> NBOOffice {

        let office = NBOOffice()
        office.idOffice = object.idOffice
        office.image = object.image
        office.name = object.name

        return office
    }

}
