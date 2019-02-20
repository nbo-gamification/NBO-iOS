//
//  NBOPlayerOfficeProgressCodable.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOPlayerOfficeProgressCodableList: Decodable {
    public let list: NBOPlayerOfficeProgressCodable?
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        list = try container.decode(NBOPlayerOfficeProgressCodable.self)
    }
}

public struct NBOPlayerOfficeProgressCodable: Codable {
    
    public let id: Int?
    public let player: NBOPlayerCodable?
    public let office: NBOOfficeCodable?
    public var categoryOfficeProgressList : [NBOPlayerCategoryOfficeProgressCodable]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case player
        case office
        case categoryOfficeProgressList
    }
}
