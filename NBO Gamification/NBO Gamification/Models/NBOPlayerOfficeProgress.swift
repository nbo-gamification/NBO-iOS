//
//  NBOPlayerOfficeProgress.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation
import RealmSwift

public final class NBOPlayerOfficeProgress: Object {
    public var nboPlayer: NBOPlayer?
    public var nboOffice: NBOOffice?
    public var idPlayerOfficeProgress: String?

    public override static func primaryKey() -> String? {
        return "idPlayerOfficeProgress"
    }
}
