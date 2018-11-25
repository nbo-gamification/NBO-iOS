//
//  NBOOfiice.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation
import RealmSwift

public final class NBOOffice: Object {
    public var idOffice: String?
    public var name: String?
    public var image: String?

    public override static func primaryKey() -> String? {
        return "idOffice"
    }
}
