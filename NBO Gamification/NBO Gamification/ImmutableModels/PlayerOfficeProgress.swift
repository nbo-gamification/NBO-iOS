//
//  PlayerOfficeProgress.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct PlayerOfficeProgress: Codable {
    public var player: Player?
    public var office: Office?
    public var idPlayerOfficeProgress: String?

    enum CodingKeys: String, CodingKey {
        case player
        case office
        case idPlayerOfficeProgress
    }
}
