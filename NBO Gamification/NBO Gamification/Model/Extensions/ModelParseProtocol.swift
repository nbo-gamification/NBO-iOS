//
//  ModelParseProtocol.swift
//  NBO Gamification
//
//  Created by dante on 20/02/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation

protocol ParseProtocol {

    associatedtype ModelCodable: Codable
    associatedtype Model: ParseProtocol

    static func initFromCodable(object: ModelCodable) -> Model?
}
