//
//  NBOOfficeCodable.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOOfficeCodable: Codable {
    
    public let id: Int?
    public let officeName: String?
    public let officeImagen: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case officeName
        case officeImagen
    }
}
