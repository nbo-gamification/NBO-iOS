//
//  NBOPlayer.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation
import RealmSwift

public final class NBOPlayer: Object {

    public var id: String?
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var password: String?
    public var isActive: Bool?

    public override static func primaryKey() -> String? {
        return "id"
    }

}
