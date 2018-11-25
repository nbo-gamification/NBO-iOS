//
//  Office.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct Office: Codable {
    public let idOffice: String?
    public let name: String?
    public let image: String?

    enum CodingKeys: String, CodingKey {
        case idOffice
        case name
        case image
    }
}
