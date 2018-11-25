//
//  Player.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct Player: Codable {
    public let firstName: String?
    public let lastName: String?
    public let email: String?
    public let password: String?
    public let isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case email
        case password
        case isActive
    }
}
